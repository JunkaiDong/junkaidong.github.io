@def title = "Halperin (mmn)"

## Spin State of Halperin $(mmn)$ States

This note aims to clarify many folklores that I have heard for a long time: that the Halperin $(112)$ state is a singlet; that the $(n+1,n+1,n)$ state that is a singlet; that all other $(mmn)$ states are not singlets. I thank Patrick J. Ledwith and Tomohiro Soejima for providing some of the crucial arguments discussed here. Main references are David Tong's Notes on quantum Hall effects and Jainendra Jain's book *Composite Fermions*.

\toc

### The Halperin $(mmn)$ states

The Halperin $(mmn)$ state is defined as

$$\Psi(\{z_i\},\{w_i\}) = \prod_{i \l j}^{N_z} (z_i-z_j)^m \prod_{i \l j}^{N_w} (w_i-w_j)^m \prod_{i,j}(z_i-w_j)e^{-\phi(\{z_i\},\{w_i\})},$$

in which $\phi(\{z_i\},\{w_i\}) = -(\sum_i |z_i|^2-\sum_i |w_i|^2)/4\ell^2$ describes the Gaussian factor of the lowest Landau level. In practice, this state should be interpreted as a two-component many-body state:

$$\ket{\Psi} = \int Dz_i Dw_i\Psi(\{z_i\},\{w_i\}) \prod_i c^\dagger_{\uparrow}(z_i) \prod_i c^\dagger_{\downarrow}(w_i) \ket{0}.$$

$\ket{\Psi}$ is an eigenstate of $S_z$ with eigenvalue $(N_\uparrow-N_\downarrow)/2$. It describes the Abelian Chern-Simons theory with

$$K = \begin{pmatrix}
m & n \\
n & m
\end{pmatrix}, \quad t = (1,1).$$

The ground state degeneracy on a torus is $|\det K| = |m^2-n^2|$. (Note that $K$ is assumed to be non-singular; the $(mmm)$ state describes a Laughlin $\nu=1/m$ state that has degeneracy $m$.) The filling at which this state can occur is

$$
\nu = t^T K^{-1} t = \frac{2m-2n}{m^2-n^2}=\frac{2}{m+n}
$$

Due to Galilean symmetry, $\sigma_{xy} = \nu$.

These are the basic features of the $(mmn)$ state. We will now set $S_z=0$ and seek the answer to the question: which of these $(mmn)$ states are singlets? To do this we need an interesting condition called the Fock's cyclic condition (FCC).

### Fock's cyclic condition

The FCC states the following condition. Given a many-body state $\Psi(\{z_i\},\{w_j\})$, in which $z_i$ describes the positions of the up-spin electrons and $w_j$ describes the positions of the down-spin electrons, we say the state satisfies the FCC condition if and only if

$$
\sum_{i} (z_i, w_j)\Psi = \Psi
$$

where $(z_i, w_j)$ means that one switches the position of $z_i$ and $w_j$ in the wavefunction. Although this might seem quite bizarre, it implies something deep: one can prove that, $\Psi$ has total angular momentum $S=S_z$ if and only if FCC holds; in other words, $S^+ \Psi = 0$.

To prove this think about the action of $S^+$ on $\Psi$; this is going to split into $S^+ = \sum_j S_j^+$. We will now show that $S_1^+\Psi=0$ is equivalent to the FCC condition with $j=1$; one can convince themselves that given fermionic exchange, the FCC statement shouldn't depend on $j$.

With the many-body state (2) we write down the action of $S_1^+$:

$$
S_1^+\ket{\Psi} = \int Dz_i Dw_j \Psi(\{z_i\},\{w_j\})\prod_i c^\dagger_{\uparrow}(z_i)c^\dagger_{\uparrow}(w_1)\prod_{j\neq 1} c^\dagger_{\downarrow}(w_j) \ket{0}
$$

Now if this state is zero, all the wavefunction amplitudes must be zero. What is the wavefunction amplitude corresponding to the component $\prod_i c^\dagger_{\uparrow}(z_i)c^\dagger_{\uparrow}(w_1)\prod_{j\neq 1} c^\dagger_{\downarrow}(w_j) \ket{0}$? It is simply $\Psi(\{z_i\},\{w_j\})$, anti-symmetrized over all the up-spin electron coordinates (the down-spins have already been anti-symmetrized.) It is then not hard to see that the antisymmetrization gives the wavefunction amplitude of $\Psi - \sum_i (z_i, w_1)\Psi$.

### Which are singlets?

We now have a powerful tool to check whether the state could be a singlet. Given that for a state to be a singlet, $N_\uparrow$ must be equal to $N_\downarrow$, or $S_z$ must be zero, it is a singlet if and only if it satisfies the FCC.

We will now prove the only singlets are of type $(n+1,n+1,n)$. To see that $(n+1,n+1,n)$ is a singlet, note that it can be seen as symmetrically attaching $n$ vortices to a fully filled (with both spins) LLL wavefunction. Given that symmetrically attaching vortices don't change the $SU(2)$ symmetry (check for yourself!), and that a fully filled band is a singlet, the state must be a singlet. Proving that all others are not singlets is much more tricky.

Preemptively, we will call our chosen $w_j$ to be risen $z_0$. We will use the sign convention that the wavefunction is written as

$$
\Psi = \prod_{i\l j} (z_i-z_j)^m(w_i-w_j)^m  \prod_{i, j} (z_j-w_i)^n \prod_i (z_0-w_i)^m (z_0-z_i)^n
$$

where the Gaussian factor has been premptively omitted. We will use the convention that Latin indices $i,j,\dots$ will not run through $0$.

Then, given that

$$
(z_0, z_k)\Psi = (-1)^n\prod_{i\neq k}\left(\frac{z_0-z_i}{z_k-z_i}\right)^{m-n}\prod_{j}\left(\frac{z_k-w_j}{z_0-w_j}\right)^{m-n} \Psi
$$

Define $L=m-n$. Thus, what we need to prove is that

$$
F(\{z_i\},\{w_j\})=1-(-1)^n\sum_k \prod_{i\neq k}\left(\frac{z_0-z_i}{z_k-z_i}\right)^{L}\prod_{j}\left(\frac{z_k-w_j}{z_0-w_j}\right)^{L} \neq 0
$$

for $L\neq 1$. Now the proof is divided into several cases.

#### $L=0$

This case is trivial; as long as the particle number is large, $F$ is a large nonzero constant.

#### $L \l 0$

This case is also easy. We note that $F$ is a holomorphic function in all the variables. Let's consider the variable $q_{kj}=z_k-w_j$. Given this is a linear transformation the function had better be a holomorphic function of $q_{kj}$ too. Now we only need to look at the function as a monovariable holomorphic function, with all other variables as parameters: i.e. $F=F(q_{kj};\dots)$. How do we prove that this is nonzero? We will study its singular behavior. We note that the leading singularity of $q_{kj}\to 0$ come only from one term (note $L<0$!), and it could not be cancelled by anything else; this leads to the conclusion that $F\neq 0$.

#### $L \g 0$

This is more difficult. We will consider the leading singularity when $z_{ij}=z_i-z_j$ goes to zero.. Now the leading contributions come from two terms, which can be possibly cancelled:

$$
\begin{aligned}
F(z_{ij},\dots) &\propto \frac{\prod_{k\neq i,j}(z_0-z_k)^L\prod_{k\neq i,j, \, l}(z_k-w_l)^L}{\prod_l (z_0-w_l)^L}\\
&\left(\frac{(z_0-z_j)^L\prod_l (z_j+z_{ij}-w_l)^L}{\prod_{k\neq i,j}(z_j+z_{ij}-z_k)^L}+(-1)^L \frac{(z_0-z_{j}-z_{ij})^L\prod_l (z_j-w_l)^L}{\prod_{k\neq i,j}(z_j-z_k)^L}\right) \frac{1}{z_{ij}^L} + \dots
\end{aligned}
$$

Let's define

$$
F_1=\frac{(z_0-z_j)^L\prod_l (z_j+z_{ij}-w_l)^L}{\prod_{k\neq i,j}(z_j+z_{ij}-z_k)^L}, \quad F_2 = \frac{(z_0-z_{j}-z_{ij})^L\prod_l (z_j-w_l)^L}{\prod_{k\neq i,j}(z_j-z_k)^L}.
$$

One can convince themselves that $F_1=F_2$ when $z_{ij}=0$. Hence, if $L$ is even, $F_1$ and $F_2$ wouldn't cancel each other; the leading singularity survives. So the only possibility is from $L$ positive and odd.

Now let's prove that

$$
F_1-F_2 = F_3 z_{ij} + O(z_{ij})^2
$$

where $F_3$ is a nonzero holomorphic function. Explicit derivatives show that

$$
F_3 = L\frac{(z_0-z_j)^L\prod_l (z_j-w_l)^L}{\prod_{k\neq i,j}(z_j-z_k)^L}\left(\sum_l\frac{1}{z_j-w_l}-\sum_{k\neq i,j}\frac{1}{z_j-z_k} + \frac{1}{z_0-z_j}\right)
$$

which, again according to the singularity counting trick, is nonzero.

Thus the leading singularity of $F$ in $z_{ij}$ is $z_{ij}^{-(L-1)}$. If $L=1$, regular terms that we have ignored can come in and potentially cancel them out; however, when $L>1$, no other terms can cancel this singularity. Hence the FCC is not satisfied, and these states cannot be singlets.

In conclusion: the only singlet is the $(n+1, n+1, n)$ state.

### So what's the mysterious $(112)$ state?

As it turns out this is really a misnomer. I think it's better thought of a $(\bar{1}\bar{1}2)$ state -- at filling $2/3$, one can check that filling two *hole* Landau levels (which can be spin up plus spin down LLLs) of the two flux composite fermion gives the correct filling. This state should be what was found in numerics.