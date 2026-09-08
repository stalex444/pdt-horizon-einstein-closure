# KMS selection of the horizon shear

## Result

The previous optical construction showed that the quartic response

```text
K_Q = [[1,-lambda4],[-lambda4,1]]
```

is the endpoint of an exact affine null-screen Jacobi flow whose initial
deformation is pure shear and whose area ratio is

```text
det K_Q = 1-lambda4^2.
```

This note proves the reverse statement.  Let `M` be a two-channel horizon
screen response.  Require:

1. exchange symmetry of the two screen channels;
2. unit mean normalization of the diagonal response;
3. the quartic KMS/core weight `1/Q` on either exchange eigenspace; and
4. affine propagation from the identity screen to `M`.

Lean proves that the entire flow is forced, up to the sign convention for
the shear:

```text
J(t) = I + t [[0,-lambda4],[-lambda4,0]]
```

or its sign-flipped version.  The sign is an orientation choice.  Both
branches have the same determinant, focusing, and gravity response.

The theorem therefore fixes more than the endpoint area factor.  It fixes
the initial optical shear and every intermediate screen map.

## Why the square is the gravitational quantity

Faulkner and Speranza derive the null gravitational energy density on a
horizon as

```text
t_vv^(g) = (1/(8 pi G))
  (sigma_ab sigma^ab - ((d-3)/(d-2)) Theta^2).
```

For linearized gravitons about a Killing horizon, the expansion vanishes at
first order and the density reduces to the squared perturbative shear.  The
horizon area is consequently constant at first order and responds at second
order.  This is their equations (3.27), (3.39)--(3.41).

The PDT optical flow has exactly that pattern:

```text
Theta(0) = 0,
||sigma(0)||^2 = 2 lambda4^2.
```

The one-sided modular Hamiltonian uses a linear boost weight along the null
generator.  Suppressing the common `2 pi`, area-measure, and Newton factors,
the unit-interval flux of the constant linearized shear is

```text
integral_0^1 t ||sigma(0)||^2 dt
  = integral_0^1 2 t lambda4^2 dt
  = lambda4^2.
```

Lean proves this integral exactly and then proves

```text
boost-weighted shear flux
  = lambda4^2
  = 1-det K_Q.
```

Thus the screening deficit is precisely the dimensionless quadratic shear
flux in the standard perturbative horizon normalization.  The first-order
shape information cancels between the two screen directions; its quadratic
gravitational energy survives.

## What is forced and what is placed

The mathematical result is unconditional once the four displayed boundary
conditions are supplied.  The quartic polynomial fixes `Q`; the primitive
quartic graph fixes the critical KMS weight `1/Q`; exchange symmetry and unit
normalization then fix the response matrix; affine null propagation fixes the
complete congruence; Raychaudhuri fixes its focusing; and the horizon
constraint fixes the modular-energy/area balance.

The remaining physical placement statement is now singular and explicit:

> The physical horizon screen carries the quartic KMS/core line on one of its
> two exchange eigenspaces.

That statement is the PDT identification of the Q sector with the horizon's
modular information channel.  It is not silently proved by finite matrix
algebra.  Standard gravitational-algebra results supply the surrounding
physics: modular flow is geometric on the horizon, the gravitational
constraint produces a crossed product, the graviton null energy is squared
shear, and the horizon-cut area is balanced by the one-sided modular
Hamiltonian.  They do not independently select the discrete number `Q`.

This is a useful stopping point for the derivation.  A physical theory must
state at least one correspondence between its mathematical structure and the
world.  Here that correspondence is narrow, falsifiable, and now isolated
from all downstream consequences.

## Kernel surface

The main declaration is

```text
GravityScreening.quarticKMSOpticalBoundarySelection_capstone
```

in `GravityScreening/KMSOpticalBoundarySelection.lean`.  It states together:

- uniqueness of the full affine optical flow up to shear orientation;
- the exact quartic determinant;
- equality of the shear with the quartic Perron residual;
- positivity of the selected response;
- equality of unit boost-weighted shear flux, `lambda4^2`, and the missing
  area fraction;
- zero initial expansion; and
- exact preservation of the horizon-cut constraint after the corresponding
  modular-energy update.

The file contains no `sorry`, `admit`, or added axiom.

## Primary source

- T. Faulkner and A. J. Speranza, *Gravitational algebras and the generalized
  second law*, especially equations (3.27), (3.32), and (3.38)--(3.48):
  <https://arxiv.org/abs/2405.00847>.
