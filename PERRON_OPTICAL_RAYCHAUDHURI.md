# The Perron optical flow: why gravity sees the square

## Result

The canonical quartic response is the endpoint of an exact two-dimensional
null-screen Jacobi flow.  Write

```text
lambda = lambda4 = 1 - 1/Q,

V_Q = [[0,-lambda],[-lambda,0]],

J_Q(t) = I + t V_Q
       = [[1,-t lambda],[-t lambda,1]].
```

Then

```text
J_Q(0) = I,
J_Q(1) = K_Q,
J_Q''(t) = 0,
tr(V_Q) = 0,
V_Q^2 = lambda^2 I,
det J_Q(t) = 1-t^2 lambda^2.
```

Thus the Perron-compressed matrix is not merely assigned to a tangential
frame.  It is realized as a nonsingular affine Jacobi map throughout one
unit of affine propagation.  Its initial deformation is symmetric and trace
free: a pure two-dimensional shear with zero initial expansion.

The construction is explicit in flat double-null coordinates

```text
ds^2 = -2 du dv + dx^2 + dy^2.
```

For every transverse label `y`, Lean constructs an affine ray whose
transverse velocity is `V_Q y`, proves that its constant four-dimensional
tangent is null, and proves that the transverse cross-section at parameter
`t` is exactly `J_Q(t)y`.  Thus the matrix path is the screen Jacobi map of
an explicit null-geodesic congruence.

At the endpoint,

```text
det J_Q(1)
  = 1-lambda4^2
  = (2Q-1)/Q^2
  = S_Q.
```

The square has a direct geometric origin.  One screen direction changes at
first order by `-lambda4`, while the other changes by `+lambda4`.  Their
linear area changes cancel because the shear is trace free.  The surviving
finite area change is their quadratic product.

For the positive root of `Q^4=Q+1`,

```text
Q         = 1.2207440846057594753616853491...
lambda4   = 0.1808274866038355603004288117...
lambda4^2 = 0.03269857991146032901767327735...
S_Q       = 0.9673014200885396709823267226...
1/S_Q     = 1.033803920093973749211119713...
```

## Exact optical tensors

The screen-area ratio and expansion are

```text
A(t)/A(0) = 1-lambda^2 t^2,

theta(t)
  = d/dt log A(t)
  = -2 lambda^2 t/(1-lambda^2 t^2).
```

The optical deformation tensor is

```text
B(t) = J_Q'(t) J_Q(t)^(-1)
     = 1/(1-lambda^2 t^2)
       [[-t lambda^2,-lambda],
        [-lambda,-t lambda^2]].
```

Lean proves `B(t)J_Q(t)=J_Q'(t)` directly, without assuming the inverse
formula.  It also proves the exact decomposition

```text
B(t) = theta(t) I/2 + sigma(t),
tr sigma(t) = 0,

sigma_ab sigma^ab
  = 2 lambda^2/(1-lambda^2 t^2)^2.
```

Differentiating the expansion gives

```text
theta'(t)
  = -theta(t)^2/2 - sigma_ab sigma^ab.
```

This is the twist-free four-dimensional Raychaudhuri equation with zero
Ricci-focusing term.  The Jacobi equation is the stronger affine equation
`J_Q''=0`: the screen has no optical tidal forcing during the interval.
The finite focusing comes from the self-action of its initial shear.

This is a legitimate vacuum null-congruence kinematics.  It does not say that
every vacuum horizon has this shear, or that the shear was dynamically
created during this interval.  It gives an exact geometric realization of the
Perron-selected initial datum.

## The continuous-core clock and the same coefficient

The continuous core supplies the observer-algebra clock that the ordinary
bounded free-field wedge could not supply.  Its dual displacement by
`s=log Q` has the simultaneous actions

```text
clock character: Q^(-it),
trace weight:     1/Q.
```

Applying the trace defect twice and taking its complement gives

```text
1-(1-1/Q)^2 = 1-lambda4^2 = S_Q.
```

The new capstone proves that this core coefficient is the determinant of the
explicit Jacobi endpoint.  The operator-algebraic self-defect and geometric
shear self-focusing are therefore two exact expressions of the same
polynomial within this model.

The physical relevance of the crossed product is standard rather than a PDT
assumption.  Witten identifies the modular crossed product of the exterior
type-`III_1` algebra as a type-`II_infinity` gravitational algebra with a
trace and entropy.  Faulkner and Speranza construct crossed-product
gravitational algebras for horizon cuts, including interacting matter, and
relate their entropy to generalized horizon entropy.

## Horizon modular-energy balance

For a horizon cut, the scalar constraint used in the repository is

```text
charge + K + inverseG * area/4 = 0,
```

where `K` is the one-sided modular Hamiltonian.  This is the scalar form of
the horizon identity derived in the crossed-product treatment,

```text
A_cut/(4G) = A_infinity/(4G) - K_cut.
```

For the Perron optical endpoint, the repository defines the corresponding
modular-energy increment, and Lean proves that it exactly preserves the
assumed scalar horizon residual:

```text
Delta K_Q = inverseG * lambda4^2 * A_before / 4,

A_after
  = A_before - 4 Delta K_Q/inverseG
  = (1-lambda4^2) A_before
  = S_Q A_before.
```

The updated area and modular energy satisfy the same horizon constraint
exactly.  This supplies a direct geometric meaning for the information that
leaves the visible area channel: it is the one-sided modular-energy increment
required by the horizon-cut balance law.

## Kernel surface

The main declaration is

```text
GravityScreening.rhoQOpticalRaychaudhuriGravity_capstone
```

in `GravityScreening/PerronOpticalRaychaudhuri.lean`.  It states together:

1. irrational independence of the cubic and quartic modular clocks;
2. the exact determinant identity for the repository-defined coupling;
3. the continuous-core Q phase and self-defect;
4. an explicit affine family of rays with null Minkowski tangents;
5. affine Jacobi propagation with zero acceleration;
6. the exact differential identity having the vacuum Raychaudhuri form;
7. the canonical Perron endpoint;
8. the exact quartic screen-area ratio;
9. preservation of the horizon-cut constraint after the defined modular-energy
   increment.

All derivative statements are kernel checked.  The file uses no `sorry`,
`admit`, or added axiom.

## What remains

This result removes the earlier arbitrary tangential-frame trajectory.  The
Perron block now has an explicit null-geometric history and obeys the standard
vacuum focusing equation.

For this optical boundary step, one remaining physical question is:

> What horizon boundary law fixes the initial trace-free shear to the Perron
> value `lambda4=1-1/Q`?

The quartic transfer operator, graph KMS state, continuous-core dual action,
and null-screen geometry all select or realize the same value.  A derivation
of that boundary law from the interacting Q sector or a gravitational
constraint would close the identification.  A calculation producing a
different shear, a nonzero frequency shift, or mode mixing would falsify this
minimal mechanism.

## Primary sources

- T. Faulkner and A. J. Speranza, *Gravitational algebras and the generalized
  second law*: <https://arxiv.org/abs/2405.00847>.
- E. Witten, *Gravity and the Crossed Product*:
  <https://arxiv.org/abs/2112.12828>.
- T. Jacobson, *Thermodynamics of Spacetime: The Einstein Equation of State*:
  <https://arxiv.org/abs/gr-qc/9504004>.
