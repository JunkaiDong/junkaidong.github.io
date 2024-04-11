@def title = "Trace Inequalities"

I mainly take my inspiration from the wikipedia page and the book _Entropy and the Quantum_.

\toc

### Peierls Inequality

**Statement**. For all Hermitian $n\times n$ matrices $A$ and all differentiable convex function $f$,

$$\Tr[f(A)]\geq \sum_{i}f(\braket{u_i|A|u_i}),$$

where $\{\ket{u_i}\}$ is an orthonormal basis.

**Proof**. Take $\{\ket{v_j}\}$ to be eigenvectors of $A$ by spectral theorem and $\lambda_j\in\mathbb{R}$ be the corresponding eigenvalues. Thus

$$\begin{aligned}
\sum_{i}f(\braket{u_i|A|u_i}) &= \sum_{i} f( \sum_{j} \lambda_j |\braket{u_i|v_j}|^2)\\
& \leq \sum_{i,j} f(\lambda_j)|\braket{u_i|v_j}|^2\\
& = \sum_j f(\lambda_j)\\
& = \Tr[f(A)].
\end{aligned}$$

Equality is reached when $\{\ket{u_i}\}$ are eigenstates.

### Monotonicity of operator functions

**Statement**. For all Hermitian $n\times n$ positive definite matrices $A>B$ and all differentiable monotonic function $f$, the function $\Tr[f(A)]$ is monotonic:

$$\Tr[f(A)]\geq \Tr[f(B)].$$

**Proof**. Define $C=A-B > 0$. Consider the function $F(t) = \Tr[f(B+tC)]$. We will now prove that $F(t)$ is monotonic: that is, $F'(t)\geq 0$ for $t\in[0,1]$:

$$\begin{aligned}
\frac{d}{dt}f(B+tC)&=\sum_{n=0}^\infty \frac{d}{dt}\frac{f^{(n)}(0)(B+tC)^n}{n!} \\
&= \sum_{n=0}^\infty \frac{f^{(n)}(0)}{n!} \sum_{m=0}^{n-1}(B+tC)^{m} C (B+tC)^{n-m-1}
\end{aligned}$$

and thus

$$\frac{d}{dt}F(t) = \Tr[f'(B+tC)C] = \Tr[C^{1/2}f'(B+tC)C^{1/2}].$$

This rewriting is possible because $C$ is positive. Given that $f$ is monotonic, $f'$ is guaranteed to be positive, and thus $f'(B+tC)$ must be positive. Thus $F'(t)\geq 0$ and $\Tr[f(A)]=F(1)\geq F(0) = \Tr[f(B)]$.

Equality is reached when $f$ is a constant function.

### Convexity of operator functions

**Statement**. For all Hermitian $n\times n$ matrices $A$ and all differentiable convex function $f$, the function $F(A) = \Tr[f(A)]$ is convex:

$$\frac{1}{2} \Tr[f(A)] + \frac{1}{2}\Tr[f(B)]\geq \Tr\left[f\left(\frac{A+B}{2}\right)\right].$$

**Proof**. Consider $\ket{u_i}$ to be eigenvectors of $\frac{A+B}{2}$. Thus

$$\begin{aligned}
\Tr\left[f\left(\frac{A+B}{2}\right)\right] &= \sum_{i} f\left(\braket{u_i\left|\frac{A+B}{2}\right| u_i}\right)\\
& = \sum_{i} f\left(\braket{u_i\left|\frac{A}{2}\right| u_i}+\braket{u_i\left|\frac{B}{2}\right| u_i}\right)\\
& \leq \sum_{i} \frac{1}{2} f\left(\braket{u_i\left|A\right| u_i}\right)+\frac{1}{2}f\left(\braket{u_i\left|B\right| u_i}\right)\\
& \leq \frac{1}{2} \Tr[f(A)] + \frac{1}{2}\Tr[f(B)].
\end{aligned}$$

Equality is reached when $A=B$.

### Klein's inequality

**Statement**. For all Hermitian $n\times n$ matrices $A$ and $B$, and all differentiable convex function $f$, the following inequality holds:

$$\Tr[f(A)-f(B)-(A-B)f'(B)]\geq 0.$$

**Proof**. Consider $C=A-B$ and $F(t) = \Tr[f(B+tC)]$. $F(t)$ is thus convex and we have for $t\in(0,1)$,

$$(F(1)-F(0))\geq \frac{F(t)-F(0)}{t}.$$

Taking the $t\to 0$ limit, the RHS becomes the derivative in which we have evaluated above.

### Peierls-Bogoliubov inequality

**Statement**. For all Hermitian $n\times n$ matrices $A$ and $B$, in which $\Tr(e^{A})=1$, the following inequality holds:

$$\Tr[e^{A+B}]\geq e^{\Tr(Be^A)}.$$

**Proof**. Use Klein's inequality: take $f(A) = e^A, C=A+B, D=A+b I$. Then, 

$$\Tr[f(C)-f(D)-(C-D)f'(D)]=\Tr[e^{A+B}-e^b e^A - (B-bI)e^{b}e^{A}] = \Tr[e^{A+B}]-e^{b}\geq 0.$$

### Weyl Majorant Theorem

**Statement**. Let $\phi:\mathbb{R}_+\to\mathbb{R}_+$ be such that $\psi(x) = \phi(e^{x})$ is convex and monotonically increasing in $x$. Let $A$ be an $n\times n$ matrix, $\{s_i\}$ be its singular values, and $\{\lambda_i\}$ be its eigenvalues, both sorted in decreasing order in absolute value. Then:

$$(\phi(|\lambda_1|),\dots,\phi(|\lambda_n|))\prec_w (\phi(s_1),\dots,\phi(s_n))$$

where $\prec_w$ means weak majorization, i.e. $x\prec_w y$ if

$$\forall k, \quad \sum_{i=1}^k x_i\leq \sum_{i=1}^k y_i.$$

**Proof**. Define $|A| = (A^\dagger A)^{1/2}$ by spectral decomposition. $s_i$ are thus eigenvalues of $|A|$.

A useful inequality is the inequality between the dominant eigenvalue and the operator norm of an operator $O$: given

$$s_1(O) = ||O|| = \max_{|v|=1}\braket{v|O|v},\quad O\ket{u_1}=\lambda_1(O) \ket{u_1},$$

$s_1(O)\geq |\lambda_1(O)|$.

Now consider $O = A\wedge A\dots\wedge A$ for $k$ times. Its dominant eigenvalue is thus $\lambda_1(A)\dots \lambda_k(A)$. However, its operator norm is given by its most dominant singular value, which is $s_1(A)\dots s_k(A)$. Hence, we have proven the log-majorization for matrices:

$$\log(|\lambda_i|)\prec_w \log(s_i(A)).$$

In fact, one can prove that whenever $x\prec_w y$, there exists a doubly stochastic matrix $A$ s.t. $x=Ay$. Through this, one can prove that for any convex and non-decreasing function $f$, $f(x_i)\prec_w f(y_i)$:

$\sum_{i=1}^k f(x_i) = \sum_{i=1}^k f(\sum_{j=1}^n A_{ij}y_j) \leq \sum_{i=1}^k \sum_{j=1}^n A_{ij}f(y_j) \leq \sum_{i=1}^k f(y_i)$.

The first inequality is convexity; the next inequality is using the fact that for a doubly stochastic matrix $A$ and vector $x$, $A x\prec_w x$. Furthermore, $f$ is non-decreasing so that the ordering of $f(y_j)$ is preserved.

Applying this to the log-majorization above, taking $x_i=\log(|\lambda_i|), y_i=\log(s_i(A)), f(x) = \phi(e^x)$, we prove the theorem.

**Corollary**. Particularly, one can take $\phi(x)=x^p$, from which we deduce that $$|\Tr[A^p]|\leq \sum_{i=1}^n |\lambda_i(A)|^p\leq \Tr[|A|^p].$$


### Golden-Thompson Inequality.

**Statement**. For all Hermitian $n\times n$ matrices $A$ and $B$, $$\Tr[e^A e^B]\geq \Tr[e^{A+B}]$$.

**Proof**. By Trotterization, we write $e^{A+B} = \lim_{N\to\infty} (e^{A/N}e^{B/N})^N$. Without loss of generality we can take $N=2^M$. We now only need to prove that for any matrix $X$ and $Y$,

$$\Tr[(XY)^{2^M}]\leq \Tr[X^{2^M}Y^{2^M}],$$

in which if we take $X=e^{A/2^M}, Y=e^{B/2^M}$ we obtain the Golden-Thompson inequality.

We now use the corollary above:

$$\Tr[(XY)^{2^M}] =\Tr[((XY)^2)^{2^{M-1}}] \leq \Tr[(XYY^\dagger X^\dagger)^{2^{M-1}}] = \Tr[(X^2Y^2)^{2^{M-1}}].$$

Now, we can also repeat this procedure:

$$\Tr[(X^2Y^2)^{2^{M-1}}] = \Tr[((X^2Y^2)^2)^{2^{M-2}}]\leq \Tr[(X^4Y^4)^{2^{M-2}}].$$

Repeating this procedure for $M$ times yields the inequality above.

### Things to be constructed

#### Duality formula for entropy and Legendre transformation

#### Wigner-Yanase-Dyson conjecture and Lieb's inequality