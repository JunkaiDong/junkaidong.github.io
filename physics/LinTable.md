@def title = "Lin Table" 


## How does the Lin table work?

This short note aims to explain why one needs to introduce Lin tables and how to best understand them. Given the lack of literature on the construction of Lin tables beyond [Lin's original literature](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.42.6561), it is very difficult to get into this technique at first. Some existing implementations exist in eg. [here](https://github.com/wztzjhn/quantum_basis/tree/master) and [here](https://github.com/awietek/xdiag) and [here](https://gitlab.com/DanceQ/danceq). When I was starting to write this note, I became aware of the particularly nice paper/documentation accompanying the last codebase [here](https://arxiv.org/pdf/2407.14591), and there will be a lot of overlap in content.

I thank Dan Parker for inspiring me to finally document the thoughts on this.

\toc

### Why we need Lin tables

Say, for no particular reason, that you want to perform exact diagonalization for fermions. You construct the Hilbert space through $m$ single particle orbitals. Your Hamiltonian is a reasonable Hamiltonian and conserves the total number of fermions in the system

$$
N = \sum_{i=0}^{m-1} n_i.
$$

With this $U(1)$ conservation you are able to diagonalize the Hamiltonian in different sectors corresponding to different total number of fermions in the system. Say there are a total of $k$ fermions; then the basis states are the Fock states

$$
\ket{I} = c^\dagger_{a_1}\dots c^\dagger_{a_k}\ket{0},
$$

for which the $a_i$ are all different from each other. We will denote this space by $\mathcal{H}_k$. We also introduce the binary representation for the basis states: the state $c^\dagger_{a_1}\dots c^\dagger_{a_k}\ket{0}$ will be represented by a binary number $I = \sum_i 2^{a_i}$.

Inspecting the different basis elements, one can easily see that the Hilbert space dimension is

$$
d(m,k) = \binom{m}{k}.
$$

This is not a small number. Indeed let's consider the scenario where $k=m/2$. Using Stirling's approximation we obtain

$$
d(m,m/2)\approx \frac{2^m}{\sqrt{m\pi/2}}.
$$

This is huge: for $m=40$, $d\approx 10^{11}$. Thus one would be working with an matrix of size $10^{11}$. Fine, you say: as long as I want the extremal eigenvalues I can just use the Lanczos algorithm, which does not require me to store the matrix in the memory. Two things will now arise as problems. First of you one needs to keep track of the vector throughout the Lanczos algorithm. If you use `ComplexF64` in julia that's about $1.6\textrm{TB}$. How very impressive that you have such a huge chunk of RAM. If you don't, you can do distributed ED where you chop the vector up into chunks. However, another big problem will arise, which necessitates the usage of Lin tables.

Let's illustrate this with a simple example. Say $m=6, k=3$. Consider the state

$$
\ket{000111} = c^\dagger_2 c^\dagger_1c^\dagger_0\ket{0}.
$$

Say the Hamiltonian has a term

$$
H = -t c^\dagger_4c_0+\dots
$$

then, when $H$ acts on the basis state, we should obtain a term

$$
H\ket{000111} = -t\, c^\dagger_4 c^\dagger_2c^\dagger_1 \ket{0} +\dots = -t\ket{010110} + \dots
$$

At this point, conceptually we know that there should be a matrix element between the basis states $\ket{000111}$ and $\ket{010110}$. However, you don't necessarily know where you should put this matrix element -- $-t$ -- into the $d\times d$ Hamiltonian matrix. Which indices do $000111$ and $010110$ correspond to? Note, if one were lazy and not make use of any symmetries this would not be a problem; one would just use $I$ itself as the index. It is only when we start to make use of symmetries to reduce the sizes of the Hilbert space that this becomes a problem.

One simple solution would be to have a lookup table $J(I)$. Note how large this lookup table would have to be -- at least one needs to memorize an `UInt64` for each basis vector. This would be a total of $800\textrm{GB}$ in total! This would have to go into your RAM and it is extremely annoying to access; note the access time of RAM is about $100\textrm{ns}$, which could be 300 CPU cycles!

This is where Lin table comes into play: it breaks the annoying lookup table $J(I)$ into smaller objects which can be contained within L2/L3 caches, which are way smaller but way faster (about $10$ times faster for L2 caches) to access.

### Construction of Lin tables

Consider a partition of the orbitals. Recall the original orbitals are numbered from $0$ to $m-1$; we will call the set of orbitals from $0$ to $m/2-1$ $A$, and the rest $B$. A fermionic combination represented by a binary $I$ can be fully specified by the occupations in set $A$, denoted $I_A$, and the occupations in $B$, denoted $I_B$. To give an example, for $m=6$, $A=\{0,1,2\}$, $B=\{3,4,5\}$; say $I=010110$, then $I_A = 110$, $I_B=010$.

Claim: one can find a suitable ordering of orbitals $J(I)$, such that

$$
J(I) = J_A(I_A) + J_B(I_B).
$$

Let's do a concrete construction for these functions, in order to obtain some intuition. Generalization should be easy. Let's again take $m=6, k=3$; this would correspond to a total of $d(6,3)=20$ elements.

$$
\begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
I_B &              &              &              &              &              &              &              &              &       \\ \hline
111 & \times &              &              &              &              &              &              &              &       \\ \hline
110 &              & \times & \times &              & \times &              &              &              &       \\ \hline
101 &              & \times & \times &              & \times &              &              &              &       \\ \hline
100 &              &              &              & \times &              & \times & \times &              &       \\ \hline
011 &              & \times & \times &              & \times &              &              &              &       \\ \hline
010 &              &              &              & \times &              & \times & \times &              &       \\ \hline
001 &              &              &              & \times &              & \times & \times &              &       \\ \hline
000 &              &              &              &              &              &              &              & \times &       \\ \hline
& 000        & 001        & 010        & 011        & 100        & 101        & 110        & 111        & I_A \\ \hline
\end{array}
$$

Here on the $x$ axis I write out all the possible $I_A$ and on $y$ axis all the $I_B$. The checkmarks correspond to the basis elements that lie in $\mathcal{H}_3$ after I concatenate $I_A$ and $I_B$. 

Although this looks like a mess, it will suddenly become much better if I do a rearrangement of the basis elements:

$$
\begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
I_B &              &              &              &              &              &              &              &              &       \\ \hline
111 & \times &              &              &              &              &              &              &              &       \\ \hline
110 &              & \times & \times &  \times            &  &              &              &              &       \\ \hline
101 &              & \times & \times &  \times            &  &              &              &              &       \\ \hline
011 &              & \times             & \times             & \times &              &  &  &              &       \\ \hline
100 &              &  &  &              & \times  &  \times              &   \times            &            &     \\ \hline
010 &              &              &              & &    \times           & \times & \times &              &       \\ \hline
001 &              &              &              & &    \times           & \times & \times &              &       \\ \hline
000 &              &              &              &              &              &              &              & \times &       \\ \hline
& 000        & 001        & 010        & 100        & 011        & 101        & 110        & 111        & I_A \\ \hline
\end{array}
$$

What we have used is, the total number of particles must get divided such that $A$ gets $0,1,2,3$ particles. Respectively, $B$ must possess $3,2,1,0$ particles.

Note how the blocks are all rectangular! This is not a coincidence and you should be able to understand it through the partitioning of particles again. To be very pedantic, take a look at the same diagram for $\mathcal{H}_{2}$:

$$
\begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
I_B &              &              &              &              &              &              &              &              &       \\ \hline
111 &  &              &              &              &              &              &              &              &       \\ \hline
110 &  \times            &  &   &          &  &              &              &              &       \\ \hline
101 &   \times           &   &  &             &  &              &              &              &       \\ \hline
011 &   \times           &            &             &   &              &  &  &              &       \\ \hline
100 &              & \times  & \times &   \times           &   &            &             &            &     \\ \hline
010 &              & \times  & \times & \times &          &  & &              &       \\ \hline
001 &              & \times  & \times & \times &          &  & &              &       \\ \hline
000 &              &              &              &              &  \times   & \times   & \times   &  &       \\ \hline
& 000        & 001        & 010        & 100        & 011        & 101        & 110        & 111        & I_A \\ \hline
\end{array}
$$

We will now assign numbers to the basis elements of $\mathcal{H}_3$, i.e. we will replace the checkmarks with numbers. What we will make use of is exactly the rectangularity-of-blocks structure. One of such numberings is the following:

$$
\begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
I_B &              &              &              &              &              &              &              &              &       \\ \hline
111 & 0 &              &              &              &              &              &              &              &       \\ \hline
110 &              & 1 & 2 &  3            &  &              &              &              &       \\ \hline
101 &              & 4 & 5 &  6            &  &              &              &              &       \\ \hline
011 &              & 7  & 8  & 9 &              &  &  &              &       \\ \hline
100 &              &  &  &              & 10  &  11              &   12            &            &     \\ \hline
010 &              &              &              & &    13           & 14 & 15 &              &       \\ \hline
001 &              &              &              & &    16           & 17 & 18 &              &       \\ \hline
000 &              &              &              &              &              &              &              & 19 &       \\ \hline
& 000        & 001        & 010        & 100        & 011        & 101        & 110        & 111        & I_A \\ \hline
\end{array}
$$

Indeed you can observe that the numbering of each block has the following pattern: they all look like

$$
\begin{array}{|c|c|c|c|c|}
\hline
I_B & & & & \\ \hline
I_{B0} & a & a+1 & a+2 & \dots \\ \hline
I_{B1} & a+d & a+d+1 & a+d+2 & \dots \\ \hline
I_{B2} & a+2d & a+2d+1 & a+2d+2 & \dots \\ \hline
\dots & \dots & \dots & \dots & \dots \\ \hline
& I_{A0} & I_{A1} & I_{A2} & \dots & I_A\\ \hline
\end{array}
$$

Thus for this block alone one can construct the functions $J_A$ and $J_B$ as

$$
\begin{aligned}
&J_A(I_{A0}) = 0,\,\, J_A(I_{A1}) = 1,\,\, J_A(I_{A1}) = 2,\,\,\dots \\
&J_B(I_{B0}) = a,\,\, J_B(I_{B1}) = a+d,\,\, J_B(I_{B1}) = a+2d,\,\,\dots
\end{aligned}
$$

which will then satisfy $J(I) = J_A(I_A)+J_B(I_B)$. One can then work block by block to construct the full functions $J_A$ and $J_B$. For our numbering shown above, the values are

$$
\begin{array}{|c|c|c|c|c|c|c|c|c|}
\hline
& 000        & 001        & 010        & 100        & 011        & 101        & 110        & 111        \\ \hline
J_A & 0 & 0 & 1 & 2 & 0 & 1 & 2 & 0 \\ \hline
J_B & 19 & 16 & 13 & 10 & 7 & 4 & 1 & 0 \\ \hline
\end{array}
$$

I suggest the reader to verify by hand that this is indeed matches $J(I)$ above.

The objects $J_A(I_A)$ and $J_B(I_B)$ are the Lin tables. They are significantly smaller objects. Indeed they are of size $\sqrt{d(m,k)}$; for $m=40, k=20$, they are of sizes $2.5\textrm{MB}$ and can thus fit into the caches, significantly reducing the lookup cost.

Generalization to Hilbert spaces with finitely generated Abelian symmetries (just use the decomposition theorem) and multiple Lin tables are trivial. One can also calculate what's the optimal number of Lin tables to use if they were to be the most memory efficient.
