@def title = "Kramers-Wannier" 

This is probably the most interesting stuff I learned about during my first semester at Harvard.

## Kramers-Wannier Duality

Consider 1D Transverse Field Ising Model: $$H=-\sum_i\sigma^z_i\sigma^z_{i+1}-g\sum_i\sigma^x_i$$
 
It is well known by K-W that $H(g)$ is dual to $H(1/g)$. A similar phrasing can be posed for 2D Ising because 1D transverse Field Ising is dual to 2D Ising. It can be easily shown via transfer matrix methods (cf. Kogut RMP.)
Isn't it confusing that for large $g$, $H(g)$ is in the paramagnetic phase and hence has one ground state, while $H(1/g)$ is in the ferromagnetic phase, undergoes SSB and has _two_ ground states?
We study the Kramers-Wannier duality more carefully, on a closed chain. It is important to notice that the closed chain is not defined trivially here. We consider a length $N$ ring by gluing together spins at position 
$0$ and $N$ via imposing bounday conditions. We can either phrase the boundary conditions in operator language or state language. But either way, there are constraints that the BCs must satisfy: they must preserve the operator algebra (which is automatic if we can find a state interpretation) and they must respect the $\mathbb{Z}_2$ symmetry of Ising model, $P=\prod_{i=0}^{N-1}\sigma_i^x$.

Here are the two boundary conditions:

1. Periodic(P). That is, $\sigma_0^a=\sigma_N^a$, which means that $\ket{0}_0=\ket{0}_N$, $\ket{1}_0=\ket{1}_N$.
2. Anti-Periodic(AP). That is, $\sigma^z_0=-\sigma^z_N,\sigma^x_0=\sigma^x_N,\sigma^y_0=-\sigma^y_N$, i.e. $\ket{0}_0=\ket{1}_N$, $\ket{1}_0=\ket{0}_N$.

Now we consider the Kramers-Wannier Duality. We define $\tau$ variables on the bonds between sites: $$\tau^x_{i+1/2}=\sigma^z_i\sigma^z_{i+1},\tau^z_{i-1/2}\tau^z_{i+1/2}=\sigma^x_i$$

And thus if we consider the parity symmetry in the dual model with $\tau$ variables, we have

$$P=\prod_{i=0}^{N-1}\tau^x_{i+1/2}=\prod_{i=0}^{N-1}\sigma^z_i\sigma^z_{i+1} = \sigma^z_0\sigma^z_N = \pm 1$$
 
Hence we observe that the parity symmetry charge measures the different boundary conditions in the dual picture. 

Consider the large $g$ case for the most intuitive periodic boundary condition. In $\sigma$ variables, there is only one ground state. In 
$\tau$ variables, the corresponding ground state is unique: $\ket{GS}=\frac{1}{\sqrt{2}}(\ket{0\dots 0 }+\ket{1\dots 1}$, because the other cat state has parity $-1$. We have thus resolved the paradox.

This subtlety can be further considered for the Jordan-Wigner transformation. In that case, partition functions are completely different for free fermions in 1+1d under different boundary conditions (cf. P. Ginsparg, Applied CFT.)

The content above comes from discussion sections of PHYSICS 268, which is led by the wonderful TA Ruihua Fan in year 2021.