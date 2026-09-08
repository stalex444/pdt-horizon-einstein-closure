# PDT horizon-to-Einstein closure

This repository formalizes a conditional mathematical bridge from a quartic
KMS horizon datum to the local Einstein equation.  It contains the complete
Lean dependency chain and a five-theorem comparison surface for the Palomar
Registry.

The principal theorem is

```text
HorizonEinsteinClosure.horizonEinsteinClosure
```

It joins, in one kernel-checked statement:

1. the cubic and quartic roots `rho^3 = rho + 1` and `Q^4 = Q + 1`;
2. irrational independence of their modular clocks;
3. the complete `(rho Q)^224` gravitational response determinant;
4. classification of a two-channel horizon response from exchange symmetry,
   unit normalization, and a `1/Q` KMS/core eigenweight;
5. uniqueness of the full affine optical flow up to shear orientation;
6. an explicit affine null-geodesic congruence whose transverse Jacobi map is
   that flow;
7. the exact twist-free vacuum Raychaudhuri equation;
8. equality of the normalized boost-weighted shear flux, the quadratic
   quartic defect, and the missing screen-area fraction;
9. exact preservation of the horizon modular-energy/area constraint; and
10. the pointwise null-cone step from the local Clausius contraction to the
    Einstein-tensor equation, including its cosmological scalar.

## The mechanism

Let

```text
lambda4 = 1 - 1/Q,
V_Q     = [[0,-lambda4],[-lambda4,0]],
J_Q(t)  = I + t V_Q.
```

The quartic boundary theorem starts with an arbitrary real two-channel
response `M`.  Exchange symmetry, unit diagonal mean, and the KMS/core weight
`1/Q` on either exchange eigenspace force

```text
J_Q(t)
```

or its orientation-reversed version as the entire affine response history.
The endpoint determinant is

```text
det J_Q(1) = 1 - lambda4^2 = (2Q - 1)/Q^2.
```

Lean then realizes `J_Q(t)` as the transverse Jacobi map of explicit affine
null rays in flat double-null coordinates.  The initial expansion is zero,
the initial deformation is pure shear, and the screen area changes only at
quadratic order.  On every nonsingular cut in the unit interval,

```text
theta' = -theta^2/2 - sigma_ab sigma^ab.
```

The unit boost-weighted initial shear flux is exactly

```text
lambda4^2 = 1 - det J_Q(1).
```

This gives the screening square a geometric role: it is the second-order area
response of a trace-free null shear, with the corresponding modular-energy
increment fixed by the horizon constraint.

For the final tensor step, Lean proves constructively that a symmetric real
four-dimensional bilinear form which vanishes on every Minkowski-null vector
must be a scalar multiple of the metric.  Applying this to

```text
R_ab - 8 pi G_PDT T_ab
```

turns the local null Clausius relation into

```text
R_ab - (R/2) g_ab + Lambda g_ab = 8 pi G_PDT T_ab.
```

The same compared theorem carries the exact response determinant

```text
1/G_PDT
  = det((rho Q) I_224) det([[1,-lambda4],[-lambda4,1]]) / pi^4.
```

## What is proved and what is assumed

The Lean kernel proves every displayed implication and equality.  The source
and comparison modules contain no `sorry` or `admit`; the only reported axioms
are Mathlib's standard `propext`, `Classical.choice`, and `Quot.sound`.

Two physics premises remain explicit in the theorem statement:

- the physical horizon screen carries the quartic `1/Q` KMS/core line on one
  of its two exchange eigenspaces; and
- the local null Clausius contraction holds with `8 pi G_PDT`.

The second premise is the local input used in Jacobson's thermodynamic
derivation.  The first is the PDT horizon identification.  The repository
does not claim that finite matrix algebra independently proves that physical
placement.  It also does not formalize a global curved spacetime, the
differential Bianchi identity, stress-energy conservation, or the field
equations for arbitrary matter.

## Compared results

| Declaration | Content |
|---|---|
| `HorizonEinsteinClosure.horizonEinsteinClosure` | Integrated `rho-Q` coupling, KMS boundary, null optics, horizon balance, and local Einstein closure |
| `HorizonEinsteinClosure.kmsBoundarySelectsOpticalFlow` | Classifies the full affine flow up to orientation and proves shear-flux/area equality |
| `HorizonEinsteinClosure.quarticNullCongruenceRaychaudhuri` | Constructs the explicit null congruence and proves the differential Raychaudhuri law |
| `HorizonEinsteinClosure.nullConeRigidity4` | Proves four-dimensional null-cone rigidity constructively |
| `HorizonEinsteinClosure.nullClausiusForcesLocalEinsteinShape` | Derives the local Einstein-tensor form from the null contraction |

`Challenge.lean` states these results using only Mathlib. `Solution.lean`
reconstructs them from the independently compiled source modules.

## Registered algebraic foundations

The cubic and quartic objects are already public Palomar foundations.  This
repository builds on them rather than resubmitting their arithmetic.

| Palomar entry | Foundation used here |
|---|---|
| [PALOMAR-2026-08-19-000007](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-19-000007&version=1) | PDT Lean core, including the cubic/quartic kinematic setting |
| [PALOMAR-2026-08-31-000004](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-31-000004&version=1) | Degree-two through degree-four Mahler-measure minima |
| [PALOMAR-2026-09-01-000005](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-01-000005&version=1) | Degree-twelve compositum `Q(rho,Q)`, unit norm, and conjugate census |
| [PALOMAR-2026-09-01-000012](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-01-000012&version=1) | Golden-family Pisot boundary, including the cubic/quartic divide |
| [PALOMAR-2026-09-02-000014](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-02-000014&version=1) | Trace-form tensor products and the cubic/quartic/compositum signatures |

The separate Padovan time result is registered as
[PALOMAR-2026-08-19-000006](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-19-000006&version=1).
It supplies adjacent PDT context but is not a premise of the five compared
gravity declarations.

## Build

The toolchain is Lean `v4.31.0`, with Mathlib pinned by `lake-manifest.json`.

```bash
lake exe cache get
lake build
```

The substantive source files for the new bridge are:

- `GravityScreening/PerronOpticalRaychaudhuri.lean`
- `GravityScreening/KMSOpticalBoundarySelection.lean`
- `GravityScreening/LocalEinsteinClosure.lean`
- `GravityScreening/HorizonEinsteinClosureCapstone.lean`

The older
[gravity-screening-mechanism](https://github.com/stalex444/gravity-screening-mechanism/tree/4ad8be8c95f3170d77e4675294df79a5d53a976b)
repository is the development record.  This repository is the focused,
self-contained publication artifact.

## Primary literature

- Ted Jacobson, “Thermodynamics of Spacetime: The Einstein Equation of State,”
  *Physical Review Letters* 75 (1995), 1260–1263,
  [doi:10.1103/PhysRevLett.75.1260](https://doi.org/10.1103/PhysRevLett.75.1260).
- Thomas Faulkner and Antony J. Speranza, “Gravitational algebras and the
  generalized second law,” [arXiv:2405.00847](https://arxiv.org/abs/2405.00847).
- Edward Witten, “Gravity and the Crossed Product,”
  [arXiv:2112.12828](https://arxiv.org/abs/2112.12828).

## License

MIT.
