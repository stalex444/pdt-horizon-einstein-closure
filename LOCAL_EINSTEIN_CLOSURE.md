# From the local Clausius relation to the Einstein tensor

> Historical development note. The current selected statements and revised
> interpretation are documented in README.md, PROOF_MAP.md and PHYSICAL_SCOPE.md.

## Result

The gravity package previously contained a formalized Pauli--Fierz response
model, the quartic horizon shear, the Raychaudhuri-form identity, and the
repository-defined PDT gravitational coupling.  This note adds the pointwise
tensor
step that turns Jacobson's null-horizon relation into the Einstein equation.

In a local orthonormal frame, define

```text
g = diag(-1,1,1,1)
```

and let `M` be a symmetric rank-two tensor.  Lean proves

```text
for every null k,  k^a M_ab k^b = 0
    implies
M_ab = c g_ab
```

for some real scalar `c`.

The proof is constructive.  The three pairs of rational null directions

```text
(1, ±1, 0, 0),
(1, 0, ±1, 0),
(1, 0, 0, ±1)
```

fix the time-space entries and all four diagonal entries.  Three Pythagorean
pairs

```text
(5, 3, ±4, 0),
(5, 3, 0, ±4),
(5, 0, 3, ±4)
```

then force the remaining spatial cross terms to vanish.  No classification
theorem is imported and no coordinate coefficient is assumed.

Apply this result to

```text
M_ab = R_ab - kappa T_ab.
```

Jacobson's local Clausius argument supplies the null contraction

```text
(R_ab-kappa T_ab) k^a k^b = 0
```

for every local null generator.  The new theorem therefore produces a scalar
`Lambda` satisfying

```text
R_ab - (R/2) g_ab + Lambda g_ab = kappa T_ab.
```

This is the local Einstein tensor equation, with the cosmological term left
as the usual integration freedom.  The PDT specialization is written in
electron-mass natural units, `hbar=c=m_e=1`, and uses the defined dimensionless
coefficient

```text
kappa = 8 pi alphaG_PDT
```

where the physical identification to be tested is

```text
alphaG_PDT = alpha_G = G_N m_e^2 / (hbar c).
```

Equivalently, restoring units gives

```text
G_N = alphaG_PDT hbar c / m_e^2.
```

and proves in the same capstone that

```text
1/alphaG_PDT
  = det((rho Q) I_224) det(K_Q) / pi^4.
```

It also carries the exact irrational independence of the cubic and quartic
modular clocks, so the two-scale coefficient is attached to the actual
positive roots of `rho^3=rho+1` and `Q^4=Q+1`.

## What this closes

This closes the algebraic final step of the Jacobson route:

```text
Optical and scalar-balance branch:
  assumed quartic KMS/core weight, exchange symmetry, and normalization
  -> classified affine response and defined optical scalars
  -> initial-shear flux equals the transverse-area deficit
  + assumed scalar horizon residual using the defined PDT coefficient
  -> the defined modular-energy update preserves that residual.

Local tensor branch:
  separate assumed null Clausius relation using the same defined coefficient
  -> Einstein tensor shape.
```

The last implication is in the Lean kernel. The optical branch proves the
defined initial-shear integral and conditional scalar balance; it does not
derive a physical graviton energy operator or supply the local Clausius
premise for the tensor branch.

## Exact scope

The theorem assumes the local null Clausius relation.  Jacobson derives that
relation from local horizon thermodynamics, the Unruh temperature, entropy
proportional to area, and the Raychaudhuri equation.  Those are physics
premises, not consequences of finite matrix algebra.

The formal statement is pointwise in a local orthonormal frame.  It produces
a local scalar cosmological term.  Showing that this scalar is constant over
a connected spacetime uses the differential Bianchi identity and
stress-energy conservation; that differential-geometric step is not yet
formalized here.  Nor does the theorem construct a global solution of the
nonlinear equations for arbitrary matter.

Accordingly, this is a rigorous pointwise algebraic **equation-shape closure**, not a
formal construction of every curved spacetime.  The remaining premises are
the familiar inputs of the Jacobson derivation, PDT's physical identification
of the Q KMS line with the horizon modular channel, the electron-mass
normalization used above, and empirical equality of the defined
`alphaG_PDT` with the measured dimensionless `alpha_G`.

## Kernel surface

The main declaration is

```text
GravityScreening.pdtNullClausius_forces_localEinsteinShape
```

in `GravityScreening/LocalEinsteinClosure.lean`.  The supporting declarations
are:

```text
GravityScreening.symmetricForm_vanishes_on_nullCone_forces_metric
GravityScreening.nullClausius_forces_localEinsteinShape
```

The file contains no `sorry`, `admit`, or added axiom.

## Primary source

- T. Jacobson, *Thermodynamics of Spacetime: The Einstein Equation of State*:
  <https://arxiv.org/abs/gr-qc/9504004>.
- T. Faulkner and A. J. Speranza, *Gravitational algebras and the generalized
  second law*, for the modern null-horizon constraint, shear-energy, and
  modular-Hamiltonian formulation: <https://arxiv.org/abs/2405.00847>.
