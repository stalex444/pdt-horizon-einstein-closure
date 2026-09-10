# The Perron optical flow: why gravity sees the square

> Historical development note. The current selected statements and revised
> interpretation are documented in README.md, PROOF_MAP.md and PHYSICAL_SCOPE.md.

## Result

The canonical quartic response is the endpoint of an exact two-dimensional
affine transverse map, realized by a family of null rays in flat coordinates.
Write

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

The Perron-compressed matrix is realized as a nonsingular affine transverse
map throughout one unit of propagation. Its initial deformation is symmetric and trace
free: a pure two-dimensional shear with zero initial expansion.

The construction is explicit in flat double-null coordinates

```text
ds^2 = -2 du dv + dx^2 + dy^2.
```

For every transverse label `y`, Lean constructs an affine ray whose
transverse velocity is `V_Q y`, proves that its constant four-dimensional
tangent is null, and proves that the transverse cross-section at parameter
`t` is exactly `J_Q(t)y`. This proves a transverse-coordinate realization by
affine null rays. The displayed cuts are not generally orthogonal to the
ray tangents: for `X(t,y)=(t,t|V_Q y|^2/2,y+t V_Q y)`, their pairing is
`g(dX/dt,dX/dy_A)=(V_Q y)_A`. Thus this family does not itself establish a
single null hypersurface with these rays as generators. An orthogonal-screen
construction and identification with a physical horizon remain separate.

At the endpoint,

```text
det J_Q(1)
  = 1-lambda4^2
  = (2Q-1)/Q^2
  = S_Q.
```

The square has a direct origin in the transverse determinant. One eigen-direction changes at
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

The defined transverse-area ratio and expansion are

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

This scalar identity has the twist-free four-dimensional Raychaudhuri form
with zero Ricci-focusing term. The equation `J_Q''=0` describes the stronger
flat-spacetime affine propagation used here; Ricci-flat vacuum alone can
still have Weyl tidal curvature. The finite transverse-area change is fixed
by the initial trace-free velocity. The theorem proves these defined scalar
identities and the null-ray realization above. Their interpretation as the
optical data of a physical horizon requires the separate geometric and
physical identifications.

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

where `K` is a real scalar proposed to represent one-sided modular energy.
The model is motivated by the horizon identity in the crossed-product treatment,

```text
A_cut/(4G) = A_infinity/(4G) - K_cut.
```

The Lean construction does not construct that modular Hamiltonian or prove
its physical identification with the scalar `K`.

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

The updated area and defined modular-energy scalar satisfy the same assumed
residual exactly. This is a conditional scalar balance identity. It does not
derive a graviton stress-energy operator or the separate local null Clausius
premise used in the Einstein-tensor branch.

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

The Perron block has an explicit affine transverse history realized by null
rays, and its defined optical scalars obey the Raychaudhuri-form identity.
An orthogonal horizon-screen realization remains separate.

For this optical boundary step, one remaining physical question is:

> What horizon boundary law fixes the initial trace-free shear to the Perron
> value `lambda4=1-1/Q`?

The quartic transfer operator, graph KMS model, continuous-core dual action,
and affine transverse model express the same scalar after the displayed
placements. A derivation of that boundary law from the interacting Q sector or a gravitational
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
