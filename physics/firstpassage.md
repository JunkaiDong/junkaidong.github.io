@def title = "First Return Time of Random Walks" 

## First passage time: when can I get home?

I was reminded of related topics at KITP Many-body Optics conference. I wanted to write these down because I forget how to work them out once in a while.

\toc

### Random Walk on a Chain

A random walker initiated at the origin a chain takes probability $1/2$ to move to left and $1/2$ to move right. We ask the following question: what's the function $f(x,0,n)\equiv f(x,n)$ such that the walker is at point $x$, starting at point $0$, for the first time at step $n$?

Simple observations: $f(x,0,n)=f(-x,n)$ by inversion symmetry, so we only need to consider the case where $x>0$. Further $f(x,n)=0$ if $n<|x|$ or $n+x$ is odd; $f(x,|x|)=2^{-|x|}$.

Consider $p(x,0,n)\equiv p(x,n)$ being the possibility of being at $x$, starting at $0$, at step $n$:

$$p(x,n) = \frac{1}{2^n}\binom{n}{(n+x)/2}$$

Now let's suppose the first time that the walker reached point $x$ is $j$. Extra caution needs to be taken for the case $x=0$. Indeed the sum over $j$ is only meaningful if $j>0$ (otherwise we are double counting). Hence let's define $f(x,0)=0$; however, this causes trouble for $x=0,n=0$. Hence we should really define

$$p(x,n) = \delta_x\delta_n+ \sum_{j}f(x,j)p(x,x,n-j) = \delta_x\delta_n +\sum_{j}f(x,j)p(0,n-j)$$

This equation is convolutional, and it begs for us to consider the generating function. 

### Generating Functions

We define the generating function to be:

$$\hat{f}(z) = \sum_j z^nf(n)$$

Thus

$$
p(x,z) = \delta_x + f(x,z)p(0,z)
$$

which would mean that

$$
f(x,z) = \frac{p(x,z)-\delta_x}{p(0,z)}
$$

#### Brute force

It seems hard to calculate $p(x,z)$ for general $x$. However, $x=0$ is doable and already helps us calculate some interesting quantities:

$$
p(0,z) = \sum_m z^{2m} \frac{1}{2^{2m}} \binom{2m}{m} = \frac{1}{\sqrt{1-z^2}}
$$

Thus,

$$
f(0,z) = 1-\sqrt{1-z^2}.
$$

#### Functional equation

Now there surely is a slightly easier way to do this. We consider the generating function for the probability of first passage to position $x$. Taking $x>0$, we deduce that the procedure of hitting $x$ can be broken up into two steps: (1) the random walker hits $1$ for the first time; (2) the random walker hits $x$ starting from $1$. Thus

$$
f(x,n) = \sum_{j} f(1,j)f(x,1,n-j) = \sum_{j} f(1,j)f(x-1,n-j)
$$

and thus, $f(x,z)=f(1,z)f(x-1,z)$, and $f(x,z)=f(1,z)^x$ for $x>0$. (I have seen someone say that this also implies the Markovian property of random walks; but isn't Markovian property $f(k,n)=f(k,1)^n$?)

We now consider solving for $f(1,z)$. What could it be? We consider the first step: there is $1/2$ probability that the walker just hits $1$, and $1/2$ probability that the walker needs to start from $-1$. Thus

$$
f(1,n) = \frac{1}{2} \delta_{n,1} + \frac{1}{2}f(2,n-1)
$$

From the generating functions we read that

$$
f(1,z)=\frac{z}{2}+\frac{z}{2}f(2,z) = \frac{z}{2}(1+f(1,z)^2)
$$

from which we can read that

$$
f(1,z) = \frac{1\pm \sqrt{1-z^2}}{z}
$$

and we need to take the solution for which all the Taylor coefficients are positive. Hence we pick the sign to be minus.

Still this did not give us $f(0,z)$. What we can do is again consider the first step: with $1/2$ possibility the walker moves to the left or right. Hence, the probability of first returning after $n$ steps is

$$
f(0,n) = \frac{1}{2}(f(0,1,n-1)+f(0,-1,n-1)) = f(1,n-1)
$$

which means that

$$
f(0,z) = zf(1,z) = 1-\sqrt{1-z^2}.
$$

From this we can read off (from Taylor expanding the coefficients of powers of $z$) that

$$
f(0,2n) = \frac{(2n-3)!!}{2^n n!} = \frac{1}{2^{2n-1}n}\binom{2n-2}{n-1}
$$

#### Useful quantities

There are a bunch of interesting quantities to compute here:

- First return time. This is equal to 

$$\braket{T_f} = \sum_{n} n f(0,n) = \left.\frac{\partial}{\partial z} f(0,z)\right|_{z=1} = \left.\frac{2z}{\sqrt{1-z^2}}\right|_{z=1} =\infty$$

- Eventual return probability. This is equal to

$$R = \sum_{n} f(0,n) = f(0,z=1) = 1.$$

- Number of times returned. This is equal to

$$N_R = \sum_n p(0,n) = p(0,z=1) = \infty.$$

In fact one can see above that $R=1$ if and only if $N_R=\infty$.

Here are also some combinatorial facts that we can derive:

- Number of Dyck paths (paths that remain non-negative) with $2n$ steps:

Define $p^+(x, n)$ to be the probability that the walker used a Dyck path to reach point $x$. Let $x=0$. Similarly we can derive

$$p^+(0,n)=1+\sum_j \frac{f(0,2j)}{2}p^+(0,n-j)$$

in which the factor of $2$ accounts for the fact that the first arrival can be either positive or negative.

Solving the generating functions, we have

$$p^+(0,z) = \frac{1}{1-f/2} = \frac{2}{z^2}(1-\sqrt{1-z^2})$$

from which we can read that the number of Dyck path is

$$C_n = 2^{2n} p^+(0,2n) = 2^{2n} f(0,2n+2) = \frac{1}{n+1}\binom{2n}{n}.$$

- Number of strictly positive paths for $j$ steps:

Let $n_0 = \floor{j/2}$. The number of strictly positive path can be related to the probability that the walker did not return to the origin after $j$ steps:

$$
\begin{aligned}
D_j &= 2^{j-1} (1-\sum_{n=1}^{n_0} f(0,2n))\\
&= 2^{j-1}\left(1-\sum_{n=1}^{n_0} \frac{1}{2^{2n-1}n}\binom{2n-2}{n-1}\right)\\
&= 2^{j-1}\left[1-\sum_{n=1}^{n_0} \left(\frac{1}{2^{2(n-1)}}\binom{2n-2}{n-1} - \frac{1}{2^{2n}}\binom{2n}{n}\right)\right]\\
&= 2^{j-2n_0-1}\binom{2n_0}{n_0} 
\end{aligned}
$$

One sanity check: $D_{2n_0+1}=2D_{2n_0}$. $D_{2n_0}$ represents all strictly positive paths and thus they must end greater than or equal to $2$. Thus when we count all the paths that take $2n_0+1$ steps we can start from the paths that have $2n_0$ steps and make a random move in the end.

- Last return time distribution. 

Let's say we terminate the random walk at $2m$ steps. Then the probability that the random walk reached its last visit to the origin at step $2n$ is equal to 

$$
l(2n) = p(0,2n) s(2(m-n)) = \frac{1}{2^{2n}}\binom{2n}{n} \frac{D_{2(m-n)}}{2^{2(m-n)}} = \frac{1}{2^m} \binom{2n}{n}\binom{2(m-n)}{(m-n)}
$$

Taking $n/m=x$ and $x\to \infty$ (which means that we should use the pdf $\rho(x) = l(0,2n)/m$), using Stirling's formula we obtain

$$
\rho(x) = \frac{1}{\pi\sqrt{x(1-x)}}.
$$

All calculations can be easily generalized to biased random walks.

### Continuum Formulation

We all know that the random walk can be approximated as a diffusion equation. Let's remind ourselves how that goes.

Again we write down the probability distribution at step $n$ to be $p(x,n)$. The distribution at step $n+1$ is

$$
p(x,n+1)=\frac{1}{2}(p(x-1,n)+p(x+1,n))
$$

We now pass to the continuum. We set the time step to be $\tau$ and the lattice spacing to be $a$. Doing first order Taylor expansion on the left and second order Taylor expansion on the right, we find that 

$$
\frac{\partial \rho}{\partial t} = D \frac{\partial^2 \rho}{\partial x^2}
$$

where we are now using probability density $\rho$ and $D = a^2/2\tau$ is the diffusion coefficient.

This is how I was taught the diffusion equation. It is conveyed in the usual sense of rigor of a physicist -- which is basically none. For example, what about all the terms that we threw out in the Taylor expansion? Are they going to come back to bite us somehow? (For example, how about $\partial_x^4\rho$? It is said that this term is known to make the pdf negative.)

#### Kramers-Moyal Expansion: why is the diffusion equation only second order

We consider the master equation formulation of random walk, where

$$
\rho(x,t+\tau) = \int p(y) \rho(x-y,t)
$$

where $p(y)$ determines the transition probabilities that satisfy $\int p(y)=1$. In our case $p(y) = 1/2(\delta(x-a)+\delta(x+a))$. Taylor expanding both sides, we obtain

$$
\sum_{n>0}\frac{\tau^n}{n!}\frac{\partial^n \rho}{\partial t^n} = \sum_{n>0}(-1)^n\frac{m_n}{n!}\frac{\partial^n \rho}{\partial x^n}
$$

where $m_n$ are the moments (not cumulants!) of $p(y)$.

Now we inject some spirit of RG into this problem. We are really only interested in long time, long lengthscale behavior. This means that we should really identify

$$
t\sim N\tau\Longrightarrow\tilde{t} = t/N\tau;\quad \tilde{x} = x/L, \tilde{\rho} = \rho/L
$$

where the scaling of $L$ with respect to $N$ will be determined later.

In the rescaled variables we have

$$
\frac{\partial \tilde{\rho}}{\partial \tilde{t}} + \sum_{n>1}\frac{1}{N^{n-1}n!}\frac{\partial^n \tilde{\rho}}{\partial \tilde{t}^n} = \sum_{n>0}(-1)^n\frac{N m_n}{L^n n!}\frac{\partial^n \tilde{\rho}}{\partial \tilde{x}^n}
$$

We define 

$$\tilde{z} = \tilde{x}-\frac{m_1 N}{L}\tilde{t}$$

to account for the drift in the random walk. With that we deduce

$$
\begin{aligned}
\frac{\partial \tilde{\rho}}{\partial \tilde{t}} - \frac{m_1 N}{L}\frac{\partial \tilde{\rho}}{\partial \tilde{z}} + &\frac{1}{2N}\left[\frac{\partial^2 \tilde{\rho}}{\partial \tilde{t}^2} - \frac{2m_1 N}{L}\frac{\partial \tilde{\rho}}{\partial \tilde{z}\partial\tilde{t}} + \frac{m_1^2 N^2}{L^2}\frac{\partial^2 \tilde{\rho}}{\partial \tilde{z}^2} \right] \\+& \sum_{n>2}\frac{1}{N^{n-1}n!}\left(\frac{\partial }{\partial \tilde{t}} - \frac{m_1 N}{L}\frac{\partial }{\partial \tilde{z}}\right)^n\tilde{\rho} = \sum_{n>0}(-1)^n\frac{N m_n}{L^n n!}\frac{\partial^n \tilde{\rho}}{\partial \tilde{z}^n}
\end{aligned}
$$

Now we finally take the $N\to\infty$ limit. The first non-trivial contribution we pick up is the order $N/L^2$: setting this to be order one means that $L\sim\sqrt{N}$. One can verify that through this scaling, all other contributions drop out as we take the $N\to\infty$ limit, where we get

$$
\frac{\partial \tilde{\rho}}{\partial \tilde{t}} = \frac{N}{L^2}\frac{m_2-m_1^2}{2}\frac{\partial^2 \tilde{\rho}}{\partial \tilde{z}^2}
$$

where we can identify $m_2-m_1^2=\mu_2$ is the second cumulant, also known as the standard deviation of $p(y)$.

Let's view what we have done in an RG perspective. We have essentially identified the ''kinetic term'' -- i.e. the term that generates nontrivial dynamics -- and kept it invariant as we do the $N\to\infty$ scaling. This has generated a relevant perturbation (the drift, which scales as $\sqrt{N}$), and a bunch of irrelevant perturbations corresponding to the third and higher cumulants. Indeed, one can also prove the CLT in this way.

#### Life in the Fourier space

One can solve the diffusion equation by Fourier transforming in $x$. That is, consider Fourier transforming with the convention

$$
\rho(k,t) = \int dx e^{-ikx} \rho(x,t);\quad \rho(x,t) = \int \frac{dk}{2\pi}e^{ikx}\rho(k,t)
$$

with the initial condition that $\rho(x,t=0)=\delta(x)$, we can solve that

$$
\rho(k,t) = e^{-D k^2 t}
$$

One can fourier transform this equation to obtain the distribution of the random walker in real space. Instead of doing this, again we can think about the first passage properties. In particular, similar to before, we have

$$
\rho(x,t) = \int_0^t dt' \rho(0,t-t')f(x,t')
$$

If we introduce the Laplace transform of functions $f(t)$ as

$$
f(s) = \int_0^\infty dt e^{-st} f(t),\quad f(t) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}ds e^{st} f(s) 
$$
where $c$ is chosen to have a larger real part than any singularities of the integrand.

Given that, we can write

$$
f(x,s) = \frac{\rho(x,s)}{\rho(x=0,s)}; \quad f(k,s) = \frac{\rho(k,s)}{\rho(x=0,s)}
$$

Now let us Fourier transform the diffusion equation in $x$, and Laplace transform in $t$. This gives us

$$
-\rho(k,t=0)+s\rho(k,s) = -Dk^2 \rho(k,s)
$$

with $\rho(k,t=0)=1$, we obtain

$$
\rho(k,s) = \frac{1}{s+Dk^2}
$$

We can then Fourier transform in $x$ to get (use residues)

$$
\rho(x,s) = \frac{1}{2\sqrt{sD}} e^{-|x|\sqrt{s/D}}
$$

from which we read that

$$
f(x,s) = e^{-|x|\sqrt{s/D}}
$$

We can also solve a general first passage problem. For example, one can consider a general region $A$: starting from point $x_0$ one can ask the first passage time distribution before the random walker hits $A$. This is equivalent to solving the diffusion equation with boundary conditions such that $\rho(x\in A, t)=0$ for all $t$. Thus, $S(x_0,t) = \int dx \rho(x,t)<1$ describes the survival probability, i.e. the probability that the walker has not reached $A$ at time $t$; thus $f(x_0,t) = -\partial_t S$.

In this case let's consider starting the particle at $x_0$, and asking when it will hit $0$. Boundary condition is $\rho(x=0,t)=0$ and $\rho(x,t=0)=\delta(x-x_0)$. Given the boundary conditions, we can instead solve for $\rho(x,t=0)=\delta(x-x_0)-\delta(x+x_0)$ by image charges; after all we only care about $\rho(x>0)$. Thus, given the solution above we obtain

$$
\rho(x>0,s) = \frac{1}{2\sqrt{sD}} [e^{-|x-x_0|\sqrt{s/D}}-e^{-|x-x_0|\sqrt{s/D}}].
$$

The survival probability is thus

$$
S(x_0,s) = \int_0^\infty dx \rho(x,s) = \frac{1-e^{-\sqrt{s/D} x_0}}{s}
$$

The (Laplace transform) of first passage time distribution is thus

$$
f(x_0,s)=-[sS(x_0,s)-S(x_0,t=0)]=e^{-\sqrt{s/D}x_0}
$$

which is consistent with the solution above. Note that $f(x_0,s)$ can also be derived through the probability current: $f(x_0,s) = D\partial_x \rho(x=0,s)=e^{-\sqrt{s/D}x_0}$.

We can read off that the return probability is $f(x=0,s=0)=1$, and the expected return time is $\partial_s f(x=0,s=0)|_{s=0} = \infty$ (we take the $s\to 0$ limit first and then the $x\to 0$ limit.)

### Anomalous Diffusion

In the Kramers-Moyal expansion above we assumed that all the moments are finite. However this is not necessarily the case. Sometimes the STD of the hopping distributions are not bounded, at which time the conventional CLT and convergence to a Gaussian fails. This can lead to drastically different behavior of random walkers.

#### Superdiffusion: Lévy Flights and generalized CLT

As we have shown above, CLT is an RG statement. When we think about the distribution of a random walker at step $N_1$ and $N_2$, the distributions are both Gaussians, with appropriate rescalings of parameters. This means that Gaussians are fixed points when we consider sums of random variables. Now we may ask the question: are there any other fixed points?

As we know if we sum $N$ IID variables the fourier transform of the distributions (a.k.a. the characteristic function) obeys

$$
p(X_N) = p(\sum_i x_i); \quad p_N(k) = \int dX_N e^{ikX_N} p(X_N) = p(k)^N
$$

where $p(k)$ is the characteristic function for $p(x_i)$.

Let's say that this is a fixed point. What this means is that

$$
p_N(k) = p(a_N k)
$$

where $a_N$ is to be determined. Using the two equations above and defining $\varphi(k) = \log p(k)$, we obtain

$$
\varphi(a_N k) = N \varphi(k) \Longrightarrow k\frac{d a_N}{dN} \varphi'(a_Nk) = \varphi(k), \,\, a_N\varphi'(a_N k)= N\varphi'(k)
$$

in which we have differentiated the first equation with respect to both $N$ and $k$. Plugging the second euqation into the first, we see that

$$
\varphi'(k) = \frac{a_N}{N a_N' k} \varphi(k)
$$

The left hand side is independent of $N$, which means that all the $N$ dependence on the right hand side must cancel. This means that

$$
\frac{d a_N}{dN} = \frac{1}{\mu} \frac{a_N}{N} \Longrightarrow a_N = a_1 N^{1/\mu}
$$

We can then finally solve that

$$
\varphi(k) = v_{\pm}|k|^\mu
$$

where $v$ is generally a complex variable. We note that the differential equation for $\varphi$ above only applies to one of the half axis; the value of the prefactor $v_{\pm}$ can generally change as one goes through the origin.

To make sure that $p(x)$ is a real valued function, $v_{+}=v_-^*$. We can also use the more conventional parameterization of

$$
p(k) = \exp(-a|k|^\mu[1-i\beta \sgn(k) \tan(\pi\mu/2)])
$$

$\beta$ is used to describe the skewness of the distribution. Note that although all of these are indeed fixed points of RG, for $\mu \geq 2$ the real attractive fixed point is the Gaussian distribution. The real problem comes from $\mu=1$, also known as the Cauchy distribution, which we will not explore here; its limiting form is

$$
p(k) = \exp(-a|k|\left.[1+\frac{2i\beta}{\pi} \sgn(k)\log(|k|) \right.])
$$

Now that we understand the Fourier transforms of Lévy distributions let's look at their original distribution (with $\beta=0, a=1$):

$$
p(x) = \int\frac{dk}{2\pi} e^{ikx}p(k) =  \int\frac{dk}{2\pi} e^{ikx} e^{-|k|^\mu}
$$

For fun, one can evaluate

$$
p(x=0)=2\Gamma\left(1+\frac{1}{\mu}\right)
$$

which increases as $\mu\to 0$. One can also compute the expansion coefficients around small $x$ by expanding $\exp(ikx)$.

The more interesting behavior is the tail behavior. The intuition is that as $x\to\infty$ the dominant contribution to the integral comes from $k\sim 1/x$, which means that we should expand $e^{-|k|^\mu}$. The zeroth order contribution vanishes. To linear order of the exponential expansion we have

$$
p(x\to\infty) = -\int \frac{dk}{2\pi} e^{ikx}|k|^\mu = -\frac{\Gamma(1+\mu)}{\pi x^{\mu+1}}\textrm{Re}(e^{i\pi/2(-1-\mu)}) = \frac{\sin(\pi\mu/2)\Gamma(1+\mu)}{\pi x^{\mu+1}} + o(x^{-1-\mu})
$$

where the subleading corrections come from the next order expansions of $e^{-|k|^\mu}$. One can see that these are clearly power laws, and they all have infinite STD when $\mu\in(0,2)$. One particular situation is $\mu=2$. We see that the coefficient of $x^{-3}$ vanishes. In fact we know exactly what the Fourier transform is: it is $e^{-|x|^2/4}$. We know that the Gaussian decays much faster than any power law and cannot be expressed as a sum of power laws. This is why the expansion will fail at $\mu=2$.

Now that we know that the distributions are power laws we can also understand $\beta$ intuitively: writing $p(x)\sim A_{\pm}/|x|^{\mu+1}$, we can express

$$
\beta = \frac{A_+-A_-}{A_++A_-}.
$$

Going back to the original topic, if a random walker can jump with an infinite STD in each step, they can move much faster, This leads to superdiffusive behavior: instead of $\sqrt{\braket{X^2}}\sim N^{1/2}$, here $\sqrt{\braket{X^2}}\sim N^{1/\mu}$, which is much faster.

#### Subdiffusion: traps with random releasing times

To inhibit diffusion, one can think about a process where the random walker is so tired that they have to wait for a random amount of time before they leave. But this distribution of the wait time cannot be very trivial: here's what we mean. Let $N(t)$ be the amount of steps that the walker has taken at time $t$. Then the variance of the position, given that they have taken $N(t)$ steps, is

$$
\sigma_{X}^2 = \braket{N(t)}\sigma_{x_i}^2+\braket{x_i}^2 \sigma_{N(t)}^2
$$

This is also known as the law of total variance. Let's say that the random walk is unbiased, so that $\braket{x_i}=0$. Then we see that intuitively if the distribution of wake-up times isn't too poorly behaved -- let's say it has a finite mean and finite variance -- then $N(t)$ should roughly be $t/\braket{\tau}$, which would mean that the variance grows linearly with $t$, and we have a diffusive behavior again.

This means that we must consider situations where the distribution of wake-up times is anomalous. Let's define $\psi(t)$ to be the distribution of wake-up times, and thus the probability that the random walker has not woken up at time $t$ is

$$
\Psi(t) = 1-\int_0^t dt' \psi(t')
$$

Thus, the probability that the random walker took $n$ steps at time $t$ is equal to

$$
\psi_n(t) = \int_0^t dt_1\int_{t_1}^t dt_2\dots \psi(t_1)\psi(t_2-t_1)\dots \Psi(t-t_n)
$$

This sounds like a nasty object. However, introducing the Laplace transform in $t$, we have

$$
\Psi(s) = \frac{1-\psi(s)}{s}, \psi_n(s) = \psi(s)^n\frac{1-\psi(s)}{s}
$$

If the mean of the distribution $\psi$ (denoted by $\tau$) exists, then $\psi(s) \approx 1-s\tau$; however, if it does not exist, then $\psi(s)\approx 1-a s^{\gamma}$, implying that the distribution of $t$ is power-law like: $\psi(t)\sim 1/t^{1+\gamma}$.

The expectation value of the steps taken can be written as

$$
\braket{n(s)} = \sum_n n\psi_n(s) = \frac{1-\psi(s)}{s} \sum_n n\psi(s)^n = \frac{\psi(s)}{s(1-\psi(s))}
$$

When $\tau$ is finite, we have $\braket{n(s)}\approx \frac{1}{s^2\tau}$, implying that $\braket{n(t)}\sim t/\tau$.

However when $\tau$ is infinite, we see that $n(s)\sim 1/s^{1+\gamma}$. This means that $\braket{n(t)} \sim t^{\gamma}$ -- much slower.

With this information we can further consider the distribution of the position of the random walker. Consider the probability of the random walker being at $x$ at time $t$: the probability is

$$
\rho(x,t) = \sum_n \psi_n(t) p_n(x)
$$

in which $p_n$ is the distribution of a random walker who has taken $x$ steps. Fourier transform $x$ and Laplace transform $t$, we get

$$
\rho(k,s) = \sum_n \psi_n(s)p_n(k) = \sum_n\psi(s)^n p(k)^n\frac{1-\psi(s)}{s} = \frac{1-\psi(s)}{s(1-\psi(s)p(k))}
$$

This is also known as the Montroll-Weiss equation.

#### Phase diagram

Two parameters control our random walker: $\mu$ which determines the tail of the distribution of hopping distances, and $\gamma$ which determins the tail of distribution of wake-up times. There are four cases:

- $\mu>2, \gamma>1$:

Normal diffusion; nothing special. $X\sim t^{1/2}$.

- $\mu<2, \gamma>1$:

Random walker takes about $t$ steps, but each step is super large. Here $X\sim \braket{n(t)}^{1/\mu}\sim t^{1/\mu}$.

- $\mu>2, \gamma<1$:

Random walker takes normal steps, but sleeps for a long time between steps. Here $X\sim \braket{n(t)}^{1/2}\sim t^{\gamma/2}$.

- $\mu<2, \gamma<1$:

Random walker takes huge steps, and takes a long time to wake up. Here $X\sim\braket{n(t)}^{1/\mu}\sim t^{\gamma/\mu}$.

#### First return time 

Using the Montroll-Weiss equation, we may write

$$
\rho(k,s) = \frac{s^{\gamma}}{s(s^\gamma+k^\mu)} = \frac{1}{s+k^\mu s^{1-\gamma}}
$$

*I had hoped that at this point I could do the first return calculations for anomalous diffusion, but it seems that the computation of the Fourier transform is quite hard. Let me know if you could do it.* Reference is PRE 62, 6065 and Phys. Lett. A 273, 322-330.

### How to improve first passage time for diffusive system

From the discussion of section 2, we know that $f(x\neq 0, s=0) < 1$. This means that in general a random walker cannot effectly go through the entire space. This is because if the walker wanders to the right of the origin, it takes infinite time to come back to the origin: and we know that it can only travel to the left of the origin after passing the orgin.

In PRL 106, 160601, the authors came up with a way to deal with this problem. The idea is simple: since the walker takes so long to get back to origin, let's manually reset it!

With a reset rate $r$, starting point $x_1$ and reset point $x_0$, the Fokker-Planck equation that the random walker obeys is

$$
\frac{\partial \rho}{\partial t} = D \frac{\partial^2 \rho}{\partial x^2} - r(\rho(x, t)-\delta(x-x_0))
$$

One would have thought that the idea would be to set boundary conditions to be $\rho(0,t)=0$ and $\rho(x,t=0)=\delta(x-x_1)$, and then we can use image charge methods. This is not correct. If we were to do this, we would need to change the coefficient in front of $\delta(x-x_0)$ to be $\int_0^\infty dx \rho(x,t)$ to account for the fact that we are only really solving for this equation on the positive half axis.

Instead let's solve for $S(x_1,t)$, i.e. the probability density that a random walker survives when it started at $x_0$.

Let's now derive the diffusion equation for $S(x_1,t)$. The probability that the walker survives at position $x$ at time $t$ is $\rho(x,t|x_1)$: $S(x_1,t)=\int_0^\infty \rho(x,t|x_1)$. This equation will be the backwards master equation: instead of considering the last step in the random walk (represented by $x$), we consider the first step in the random walk (represented by $x_1$.)

Let us discretize the problem and instead consider a discrete random walk as we have done before. In that case, we have 

$$S(x_1,t) = \frac{1}{2}[S(x_1+a,t-\tau)+S(x_1-a,t-\tau)]-r\tau [S(x_1,t-\tau)-S(x_0,t-\tau)]$$ 

where the second term describes the resetting process. This then yields

$$
\frac{\partial S}{\partial t} = D \frac{\partial^2 S}{\partial x_1^2} -r(S(x_1,t)-S(x_0,t))
$$

with the boundary conditions that $S(0,t)=0$ and $S(x>0,0)=1$.

In general one can write down a transition matrix $\mathcal{T}_{x,x'}$ that describes the probability transitions from $x'$ to $x$ in each step (minus the identity). The forward master equation is

$$
\frac{\partial \rho(x,t|x_0)}{\partial_t} = \sum_{x'} \mathcal{T}_{x,x'}\rho(x',t|x_0)
$$

whereas the backward master equation is

$$
\frac{\partial \rho(x,t|x_0)}{\partial_t} = \sum_{x_0'} \rho(x',t|x_0')\mathcal{T}_{x_0',x_0}
$$

There are some interesting observations from here. For example we can ask what's the long-time probability that a particle survives. This is equivalent to solving the equation

$$
\sum_{x_0'}S(x_0')\mathcal{T}_{x_0',x_0} = 0
$$

for $x_0$ in the absorption region. (Of course there are many solutions, but we look for the minimum nonnegative solution). The expectation value of the first passage time is

$$
\braket{T(x_0)} = - \int_0^\infty dt \,t \partial_t S(x_0,t)
$$

and thus

$$
\begin{aligned}
\sum_{x_0'}\braket{T(x_0')}\mathcal{T}_{x_0',x_0} &= -\int_0^\infty dt\, t \sum_{x_0'} \partial_t S(x_0',t)\mathcal{T}_{x_0',x_0} = -\int_0^\infty dt \,t \partial_t^2 S(x_0,t) \\&= \int_0^\infty dt \partial_t S(x_0,t) = S(x_0,\infty)-S(x_0,0) = -1
\end{aligned}
$$

if the absorbing state is indeed fully absorbing i.e. $S(x_0,\infty)=0$. All of the above calculations can be generalized to arbitrary Markov chains with multiple absorbing states, and one can even calculate the first passage time of the random walker to each of the absorbing state.

But we digress. Let's try to solve the backwards master equation of the survival probability of random walk with resets. Particularly let's do a Laplace transform in time:

$$
(r+s) S(x_1,s) +D \frac{\partial^2 S(x_1,s)}{\partial x_1^2} = r S(x_0,s)+1
$$

This function can be solved exactly as

$$
S(x_1,s) = Ae^{-\alpha x_1}+Be^{\alpha x_1}+ \frac{r S(x_0,s)+1}{r+s}
$$

where $\alpha=\sqrt{(r+s)/D}$. Given $S$ is finite, $B=0$. Since $S(x_1=0, s)=0$, $A=-\frac{r S(x_0,s)+1}{r+s}$. Matching $S(x_0,s)=S(x_0,s)$ gives

$$
S(x_1,s) = \frac{1-e^{-\alpha x_1}}{s+r e^{-\alpha x_0}}
$$

From this we see that the survival probability is zero at infinite time for all $x_1$: if the survival probability tends to a constant, the low $s$ contribution would be $1/s$. However here we see that this is not the case. Thus the passage probability is

$$
f(x_1,s=0)= - s[S(x_1,s)-S(x_1,t=0)]
$$

from which we can read off

$$
\braket{T(x_1)}=S(x_1,s=0) = \frac{1-e^{-\alpha_0 x_1}}{r e^{-\alpha_0 x_0}}
$$

where $\alpha_0=\sqrt{r/D}$. This is finite now!

Again, it would be cool to see what resetting implies for Lévy flights...

### Conclusion

In this note we derived three different ways to do first passage problems:

- Solving for the first passage time distribution explicitly;

- Solving the forward master equation (forward Fokker-Planck equation) with absorbing boundary conditions, and either integrate the survival probability or compute the probability current;

- Solving the backward master equation (backward Fokker-planck equation), and then either deriving the first passage time distribution or directly solving for the expected first passage time.

<!-- We take $x_1=x_0$ later. Laplace transforming in $t$ and Fourier transforming in $x$, the equation becomes

$$
(s+r)\rho(k,s)+Dk^2\rho(k,s) =  \frac{r}{s}e^{-ikx_0}+e^{-ikx_1}
$$

With the boundary conditions that $\rho(0,t)=0$, we use the image charges to find the solution of

$$
(s+r)\rho(k,s)+D k^2\rho(k,s) =  -2i(\frac{r}{s}\sin(kx_0)+\sin (k x_1))
$$

From which we can solve that

$$
\rho(k,s) = -\frac{2i(r\sin(kx_0)/s+\sin (k x_1))}{s+r+Dk^2}
$$

Let's do a Fourier transform in $k$. 

$$
\begin{aligned}
\rho(x,s) &= -\int \frac{dk}{2\pi} e^{ikx} \frac{2i(r\sin(kx_0)/s+\sin (k x_1))}{s+r+Dk^2} \\&= \frac{1}{2\sqrt{(s+r)D}} \left[\frac{r}{s}(e^{-\alpha |x-x_0|}-e^{-\alpha |x+x_0|})+e^{-\alpha|x-x_1|}-e^{-\alpha|x+x_1|}\right]
\end{aligned}
$$

where $\alpha = \sqrt{(r+s)/D}$. Thus the survival probability is

$$
S(x,s) = \int_0^\infty dx \rho(x,s) = \frac{1}{r+s} \left[\frac{r}{s}(1-e^{-\alpha x_0})+1-e^{-\alpha x_1}\right]
$$ -->