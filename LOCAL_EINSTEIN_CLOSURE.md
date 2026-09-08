# From the local Clausius relation to the Einstein tensor

## Result

The gravity package previously contained the full linearized Pauli--Fierz
response, the quartic horizon shear, the Raychaudhuri focusing law, and the
PDT value of the gravitational coupling.  This note adds the pointwise tensor
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
as the usual integration freedom.  The PDT specialization sets

```text
kappa = 8 pi G_PDT
```

and proves in the same capstone that

```text
1/G_PDT
  = det((rho Q) I_224) det(K_Q) / pi^4.
```

It also carries the exact irrational independence of the cubic and quartic
modular clocks, so the two-scale coefficient is attached to the actual
positive roots of `rho^3=rho+1` and `Q^4=Q+1`.

## What this closes

This closes the algebraic final step of the Jacobson route:

```text
PDT coefficient
  -> quartic KMS horizon shear
  -> quadratic graviton null energy
  -> Raychaudhuri area response
  -> local null Clausius relation
  -> Einstein tensor shape.
```

The last implication is now in the Lean kernel rather than being summarized
in prose.

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

Accordingly, this is a rigorous nonlinear **equation-shape closure**, not a
formal construction of every curved spacetime.  The remaining premises are
the familiar premises of the Jacobson derivation plus PDT's explicit physical
identification of the Q KMS line with the horizon modular channel.

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
