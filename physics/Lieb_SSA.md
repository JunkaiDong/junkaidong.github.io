<!-- @def title = "Lieb_SSA"

## Lieb's Lieder: Strong Subadditivity

This note is inspired by Ruihua Fan and Tomohiro Soejima.

\toc

### Statement

The strong additivity (SSA) property of the entropy is stated in the following form:

Let $\rho$ be the density matrix of a tensor product Hilbert space $H_{123}=H_1\otimes H_2\otimes H_3$. Let $\rho_{I}$ be the reduced density matrix corresponding to the subsystem denoted by $I$, and $S_I$ be the entanglement entropy of $\rho_I$, which is potentially infinite. Then,

**Theorem (Lieb-Ruksai)**[^1]:

1. Let $H_{12}=H_1\otimes H_2$. Then the function $\rho_{12} \to S_1-S_{12}$ is convex on the set of positive, trace-class operators on $H_{12}$.

2. (SSA) $S_{123}+S_2-S_{12}-S_{23}\leq 0$, and $S_1+S_3-S_{12}-S_{23}\leq 0$.

By positive, trace-class operators, we mean operators which are positive-definite, and for which the trace is finite and well-defined.

Below we detail two proofs, one of which is the original proof by Elliott Lieb, Mary Ruksai and partly Barry Simon[^1], and another proof due to Michael Nielsen and Denes Petz[^2].

### Lieb-Ruksai-Simon Proof

The proof will be divided into two parts: the finite-dimensional case and the infinite dimensional case.

#### Finite Dimensions

Theorem 1 states that

$$(S_1-S_12)(\rho_{12})\leq \alpha (S_1-S_12)(\rho_{12}')+(1-\alpha)(S_1-S_12)(\rho_{12}'')$$

where $\rho_{12}=\rho_{12}'+\rho_{12}''$, $0\leq \alpha\leq 1$. All operators are assumed to be positive, trace-class operators. We define

$$\Delta = \alpha \Tr_{12}\rho_{12}'(-\log \rho'_{12}+\log \rho_{1}'+\log \rho_{12}-\log \rho_1),$$

$$\Gamma = (1-\alpha) \Tr_{12}\rho_{12}''(-\log \rho''_{12}+\log \rho_{1}''+\log \rho_{12}-\log \rho_1).$$



### References
[^1]: Proof of the strong subadditivity of quantum-mechanical entropy (1973). [DOI](https://doi.org/10.1063/1.1666274)

[^2]: A simple proof of the strong subadditivity inequality (2004). [DOI](https://arxiv.org/abs/quant-ph/0408130) -->