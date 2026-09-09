# PDT horizon-to-Einstein closure

Can a discrete algebraic datum constrain a null-horizon response tightly
enough to connect it to the local Einstein equation?  This repository proves
a conditional answer in Lean.  Assume that an exchange-symmetric two-channel
screen has unit diagonal mean and carries the eigenweight `1/Q`, proposed here
as a quartic KMS/core line.  Those conditions classify its affine screen flow
into one of two global orientation branches.  The positive branch is the
transverse map of an explicit affine family of null rays in flat double-null
coordinates, and its defined optical scalars satisfy the identity having the
twist-free vacuum Raychaudhuri form; the opposite orientation has the same
scalar determinant and shear-square data.  Given the separate local null
Clausius premise with the defined coefficient `8 pi alphaG_PDT`, null-cone
rigidity then forces the local Einstein-tensor form.

This is the gravity question tested here within Pisot Dimensional Theory
(PDT).  PDT begins with the positive roots

```text
rho^3 = rho + 1,       Q^4 = Q + 1.
```

In the broader theory, `rho` (also denoted `p`) is the convergent Pisot member
of this cubic/quartic boundary, while `Q` is the non-Pisot quartic member.  The
registered foundations linked below establish the relevant arithmetic.  This
submission tests one narrow proposed division of labor: the joint scale
`rho Q` is assigned to the bulk response, while the quartic inverse weight
`1/Q` is assigned to the horizon's two-channel screening response.

The mathematical contribution is the collection of exact factorization,
classification, transport, and rigidity consequences that follow from those
placements.  The physical placements remain explicit, falsifiable PDT
premises.  The repository contains the complete Lean dependency closure and a
six-theorem comparison surface for the Palomar Registry.

The integrated theorem uses the same defined scalar in two displayed premises
and proves their downstream consequences together.  It does not establish
their joint physical applicability, derive the quartic boundary line from the
Hodge divide, or derive the local Clausius premise from the optical model.

The principal theorem is

```text
HorizonEinsteinClosure.horizonEinsteinClosure
```

It joins, in one kernel-checked statement:

1. the cubic and quartic roots `rho^3 = rho + 1` and `Q^4 = Q + 1`;
2. irrational independence of their modular clocks;
3. the exact Hodge-pair identities separating the joint `rho Q` bulk scalar
   from the normalized quartic screening scalar;
4. the exact determinant identity for the repository-defined `alphaG_PDT` and its
   explicitly defined 224-dimensional scalar response block;
5. classification of a two-channel horizon response from exchange symmetry,
   unit normalization, and a `1/Q` KMS/core eigenweight;
6. uniqueness of the full affine optical flow up to shear orientation;
7. an explicit affine family of null rays in flat double-null coordinates
   whose transverse map is the positive-orientation branch;
8. an exact scalar identity having the twist-free vacuum Raychaudhuri form;
9. equality of the normalized boost-weighted shear flux, the quadratic
   quartic defect, and the missing screen-area fraction;
10. exact preservation of the assumed scalar horizon residual by a defined
    modular-energy increment using the same `alphaG_PDT`; and
11. the pointwise null-cone step from the local Clausius contraction to the
    Einstein-tensor equation, including its cosmological scalar.

## Why this is a research result

The response matrix is not inserted in its final form.  The classification
theorem begins with an arbitrary real two-channel matrix.  Exchange symmetry,
unit diagonal mean, and the quartic KMS/core weight `1/Q` on either exchange
line determine the endpoint matrix and its entire affine history, with only
the orientation of the shear left free.  Both orientations have the same
determinant and therefore the same value in the repository's defined coupling
formula.

The selected structure is then carried through five mathematical settings:

| Setting | Statement established under the displayed inputs |
|---|---|
| Lorentzian Hodge pair | The `rho`/`Q` weighted divide times its orientation flip is `(rho Q)I`; a distinct normalized quartic response times its flip is `(1-lambda4^2)I` |
| Perron/KMS boundary model | The assumed `1/Q` eigenweight, exchange symmetry, and normalization classify the two-channel response up to orientation; `Q^4=Q+1` identifies `lambda4` with the quartic residual |
| Null optics | An explicit affine null-ray family has transverse map `J_Q(t)`; the defined expansion and shear satisfy the Raychaudhuri-form identity |
| Horizon balance | The defined normalized shear flux equals `lambda4^2` and the missing area fraction; the defined modular increment preserves the assumed scalar residual |
| Local tensor geometry | Given the separate null Clausius premise for every null direction, null-cone rigidity forces the Einstein-tensor form |

The point of the combined theorem is to record more than one substitution. It
places the exact factorization, classification, and transport consequences of
each named input in one checked statement and shows where each additional
physical premise enters.  Operator-algebraic
gravity, horizon thermodynamics, formalized relativity, and algebraic dynamics
are the natural research audiences.  Questions left outside this theorem
include whether physical curvature realizes the proposed Hodge weighting,
whether an interacting horizon carries the proposed `1/Q` line, whether the
initial residual and local Clausius relation hold with the defined
`alphaG_PDT`, and whether that scalar agrees with the measured dimensionless
gravitational coupling.

## What standard theory leaves open

The comparison is precise.  Write the measured dimensionless gravitational
coupling in electron-mass units as

```text
alpha_G = G_N m_e^2 / (hbar c),
G_N     = alpha_G hbar c / m_e^2.
```

| Framework | What it supplies | What it leaves open here |
|---|---|---|
| [Standard Model](https://home.cern/science/physics/standard-model/) | Gauge interactions and matter fields, including the electron with an empirically fixed Yukawa/mass parameter used to form `alpha_G` | The minimal theory contains no dynamical gravity and does not determine `G_N` or `alpha_G` |
| [General relativity](https://pdg.lbl.gov/2023/reviews/rpp2023-rev-gravity-tests.pdf) | The geometric field-equation structure | It contains `G_N` as a coupling; its value is supplied by the [experimental CODATA adjustment](https://doi.org/10.1063/5.0279860), rather than an arithmetic derivation within GR |
| Jacobson's horizon thermodynamics | A route from a local Clausius relation to the Einstein equation | Its assumed entropy-per-area density encodes the coupling; the argument does not determine that density numerically or select `p`, `Q`, or the PDT factorization |
| This PDT artifact | An exact conditional chain built from the defined `pQ` bulk factor, quartic screen factor, and `alphaG_PDT` | The physical placements and empirical equality `alphaG_PDT = alpha_G` remain to be established |

The cited Jacobson, Faulkner-Speranza, Witten, and finite-graph KMS sources do
not supply the PDT assignments in the last row.

The capstone uses one defined `pQ`-based dimensionless scalar in both displayed
premises and proves their downstream consequences together.  Whether both
premises hold for a physical horizon, and whether `alphaG_PDT` equals the
measured `alpha_G`, remain outside the kernel result.  After restoring units,
that empirical equality is equivalent to the proposed value of `G_N` through
the conversion above.

## The PDT ingredients and their status

| Ingredient | Role in this repository | Status here |
|---|---|---|
| `rho`, the positive root of `x^3-x-1` | Cubic member of the joint bulk scale | Root relation assumed in the capstone; arithmetic foundation already registered |
| `Q`, the positive root of `x^4-x-1` | Supplies the numerical eigenweight `1/Q`, proposed as the KMS/core line, and the residual `lambda4` | Root relation and boundary placement are explicit hypotheses |
| `rho Q` | Common scalar response in the bulk determinant | The orientation-paired Hodge divide gives exactly `(rho Q)I`; joint modular identities and the irrational clock relation are also proved |
| `224 = 15^2-1` | Dimension of the displayed scalar response block | The broader PDT record derives this exponent; this artifact defines it as 224 and proves its equality and determinant consequences without re-formalizing the physical selection argument |
| `alphaG_PDT` | `pi^4 / ((rho Q)^224 (1-lambda4^2))` | Defined dimensionless scalar represented by the combined determinant; the physical proposal is `alphaG_PDT = G_N m_e^2/(hbar c)` |

This table is essential to the claim boundary.  Kernel verification proves
the implications from the displayed inputs.  It does not turn a stated PDT
assignment into an experimental fact.

`alphaG_PDT` is the prose name used here for Lean's
`gravitationalCoupling rho q`; it is dimensionless.

## Where `p` enters

The cubic root is not absent from gravity.  This repository writes it as
`rho`, while PDT often writes it as `p`.  The proposed coupling factorizes as

```text
1/alphaG_PDT
  = (p Q)^224 / pi^4
      * [1 - (1 - 1/Q)^2].
```

The two factors do different jobs:

| Layer | Role of `p = rho` | Role of `Q` |
|---|---|---|
| Registered algebraic setting | The cubic Pisot member | The quartic non-Pisot member |
| Bulk response | Enters every direction through the joint scale `p Q` | Enters every direction through the same joint scale `p Q` |
| Horizon screen | No separate `p` factor is placed in the two-channel correction | Supplies the proposed eigenweight `1/Q`, residual `lambda4`, and screen determinant |
| Einstein coefficient | Enters through the repository-defined `alphaG_PDT` | Enters through both `p Q` and the separate screen determinant |

Lean also proves from the two root equations that

```text
log(p) / log(Q) is irrational.
```

Thus the two scales cannot be reduced to integer powers of a single clock.
The package combines them in the bulk product without identifying their
individual modular rhythms.  The absence of a separate `p` term in `J_Q(t)`
is a model assignment in this proposal: `J_Q(t)` is the Q-specific horizon
correction, while the `pQ` block carries the common bulk strength.
This factorization is the precise role assigned to the cubic/quartic divide in
the present theorem; a separate `p`-dependent optical flow is not claimed.

## The mechanism

On one complexified Lorentzian Hodge pair, let `P+` and `P-` be the two
chirality projectors.  The arithmetic divide and its orientation flip are

```text
D(p,Q)      = p P+ + Q P-,
D_flip(p,Q) = Q P+ + p P-.
```

Lean proves the exact operator identity

```text
D(p,Q) D_flip(p,Q) = p Q I.
```

This gives an exact finite-dimensional operator realization of the joint bulk
factor: the product appears when the two orientations are paired.  A distinct normalized
Hodge response `I + lambda4 C` and its flip `I - lambda4 C` instead give

```text
(I + lambda4 C)(I - lambda4 C)
  = (1 - lambda4^2) I
  = ((2Q-1)/Q^2) I.
```

The theorem states these two products separately; it does not identify their
operators or infer their physical placement from Hodge algebra alone.

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

Lean then realizes `J_Q(t)` as the transverse separation map of explicit
affine null rays in flat double-null coordinates; the code calls this map
`opticalJacobi`.  The initial expansion is zero,
the initial deformation is pure shear, and the screen area changes only at
quadratic order.  On every nonsingular cut in the unit interval,

```text
theta' = -theta^2/2 - sigma_ab sigma^ab.
```

The unit boost-weighted initial shear flux is exactly

```text
lambda4^2 = 1 - det J_Q(1).
```

Within this explicit screen model, the screening square is the second-order
area response of a trace-free null shear.  The defined modular-energy
increment, using `1/alphaG_PDT`, exactly preserves the assumed scalar horizon
residual.  Thus the horizon balance and the local Einstein coefficient use
the same defined coupling.

For the final tensor step, Lean proves constructively that a symmetric real
four-dimensional bilinear form which vanishes on every Minkowski-null vector
must be a scalar multiple of the metric.  The physical reading uses
electron-mass natural units, `hbar=c=m_e=1`.  If hatted curvature and stress
denote the corresponding dimensionless tensors, the premise is

```text
Rhat_ab - 8 pi alphaG_PDT That_ab.
```

Lean then turns its null contraction into

```text
Rhat_ab - (Rhat/2) g_ab + Lambdahat g_ab
  = 8 pi alphaG_PDT That_ab.
```

The code uses unadorned `ricci`, `stress`, `area`, and `cosmological` for
dimensionless variables.  With the electron Compton length
`ell_e=hbar/(m_e c)`, the physical reading is

```text
Ghat_ab      = ell_e^2 G_ab,
That_ab      = T_ab / (m_e c^2 / ell_e^3),
Lambdahat    = ell_e^2 Lambda,
Ahat         = A / ell_e^2.
```

Undoing these normalizations and using
`alphaG_PDT = G_N m_e^2/(hbar c)` gives the usual dimensional equation

```text
G_ab + Lambda g_ab = (8 pi G_N/c^4) T_ab.
```

The same compared theorem carries the exact determinant identity for the
repository-defined coupling

```text
1/alphaG_PDT
  = det((rho Q) I_224) det([[1,-lambda4],[-lambda4,1]]) / pi^4.
```

## What is proved and what is assumed

The Lean kernel proves every displayed implication and equality.  The
substantive source modules and `Solution.lean` contain no `sorry` or `admit`;
`Challenge.lean` contains exactly six deliberate placeholders, one for each
theorem checked by Comparator.  The only axioms reported for the proved
declarations are Mathlib's standard `propext`, `Classical.choice`, and
`Quot.sound`.

The theorem keeps its physical and model inputs visible.  Its three principal
physical placements are:

- physical curvature assigns `rho` and `Q` to the two Hodge chiralities;
- the physical horizon screen carries the quartic `1/Q` KMS/core line on one
  of its two exchange eigenspaces; and
- the dimensionless local null Clausius contraction holds with
  `8 pi alphaG_PDT` in electron-mass natural units.

The capstone also assumes an initially satisfied scalar horizon constraint,
symmetry of the local Ricci and stress tensors, and the finite model choices
of a two-channel exchange-symmetric screen, unit diagonal mean, and affine
interpolation from the identity.  These assumptions are displayed in the
theorem rather than inferred from the quartic polynomial.

Both the cubic and quartic companion graphs admit finite Perron/KMS data.  The
finite graph theorem therefore does not, by itself, select `Q` rather than
`p` for the physical horizon.  That selection remains the explicit PDT
boundary premise tested by this package.

The local Clausius placement is Jacobson's local input; the quartic line is
the PDT horizon identification.  The quartic equation identifies the chosen
positive root, connects `lambda4` to
the quartic Perron residual, and enters the independent-clock result; by
itself it does not force the physical horizon to carry the `1/Q` eigenweight.
The repository also does not formalize a global curved spacetime, the
differential Bianchi identity, stress-energy conservation, or the field
equations for arbitrary matter.

## Compared results

| Declaration | Content |
|---|---|
| `HorizonEinsteinClosure.horizonEinsteinClosure` | Integrated conditional package: a defined `rho Q` coupling, optical/horizon branch, and separate Clausius-to-Einstein branch |
| `HorizonEinsteinClosure.hodgeBulkAndQuarticScreen` | Proves parameterized orientation-paired Hodge products `(rho Q)I` for the weighted divide and `((2Q-1)/Q^2)I` for the normalized response; the capstone specializes `rho` and `Q` to the two positive roots |
| `HorizonEinsteinClosure.kmsBoundarySelectsOpticalFlow` | Classifies the full affine flow up to orientation and proves shear-flux/area equality |
| `HorizonEinsteinClosure.quarticNullCongruenceRaychaudhuri` | Constructs the explicit affine null-ray family and proves the differential Raychaudhuri-form identity |
| `HorizonEinsteinClosure.nullConeRigidity4` | Proves four-dimensional null-cone rigidity constructively |
| `HorizonEinsteinClosure.nullClausiusForcesLocalEinsteinShape` | Derives the local Einstein-tensor form from the null contraction |

`Challenge.lean` states these results using only Mathlib. `Solution.lean`
reconstructs them from the independently compiled source modules.

## Registered Palomar lineage

The cubic and quartic objects already have a public Palomar history.  The
table distinguishes the intellectual lineage from the premises actually used
by the six declarations; every theorem in this repository remains
self-contained and imports no external Palomar package.

| Registered result | What it has already established | Exact role here |
|---|---|---|
| [PDT Lean core, PALOMAR-2026-08-19-000007](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-19-000007&version=1) | Earlier formalized cubic/quartic setting | Public provenance for the algebraic objects; this submission provides its own definitions and proofs |
| [Mahler minima, PALOMAR-2026-08-31-000004](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-31-000004&version=1) | Why the cubic and quartic are distinguished degree-three and degree-four objects | Selection context, not a premise of the compared gravity theorems |
| [Degree-twelve compositum, PALOMAR-2026-09-01-000005](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-01-000005&version=1) | Arithmetic structure, unit norm, and conjugate census of `Q(rho,Q)` | Lineage for the joint scale; the clock-independence proof here is self-contained |
| [Pisot boundary, PALOMAR-2026-09-01-000012](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-01-000012&version=1) | Cubic Pisot and quartic non-Pisot classification in the polynomial family | PDT interpretation context, not a theorem premise here |
| [Trace forms, PALOMAR-2026-09-02-000014](https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-02-000014&version=1) | Tensor-product trace-form results and cubic, quartic, and compositum signatures | Adjacent geometric context; the selected null-cone theorem instead uses an explicitly defined diagonal Minkowski metric |

The exact new interface is

```text
registered algebraic objects and selection context
+ conditional Hodge assignment of p and Q to opposite chiralities
-> orientation-paired bulk product pQ I
+ assumed 1/Q horizon exchange-line eigenweight, symmetry, and normalization
-> response matrix and one global affine-flow orientation
+ positive-orientation branch -> explicit null-ray realization and exact
   optical identities; both branches share the scalar determinant and
   shear-square data
+ assumed scalar horizon residual -> exactly preserved defined update
+ separate local null Clausius premise with the defined alphaG_PDT
-> local Einstein-tensor form.
```

The separate Padovan time result is registered as
[PALOMAR-2026-08-19-000006](https://palomar-registry.org/entry.html?id=PALOMAR-2026-08-19-000006&version=1).
It supplies adjacent PDT context but is not a premise of the six compared
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
- `GravityScreening/HodgeBulkScreen.lean`
- `GravityScreening/HorizonEinsteinClosureCapstone.lean`

The older
[gravity-screening-mechanism](https://github.com/stalex444/gravity-screening-mechanism/tree/4ad8be8c95f3170d77e4675294df79a5d53a976b)
repository is the development record.  This repository is the focused,
self-contained publication artifact.

## Primary literature

- Stephanie Alexander, “Deriving Gravity from First Principles: The
  Dimensional Origin of Newton's Constant,”
  [doi:10.5281/zenodo.20417378](https://doi.org/10.5281/zenodo.20417378).
- Astrid an Huef, Marcelo Laca, Iain Raeburn, and Aidan Sims, “KMS states on
  the C*-algebras of finite graphs,”
  [arXiv:1205.2194](https://arxiv.org/abs/1205.2194).
- Ted Jacobson, “Thermodynamics of Spacetime: The Einstein Equation of State,”
  *Physical Review Letters* 75 (1995), 1260–1263,
  [doi:10.1103/PhysRevLett.75.1260](https://doi.org/10.1103/PhysRevLett.75.1260).
- CERN, [“The Standard Model”](https://home.cern/science/physics/standard-model/).
- T. Damour, “Experimental Tests of Gravitational Theory,” in the 2023
  *Review of Particle Physics*,
  [PDG review](https://pdg.lbl.gov/2023/reviews/rpp2023-rev-gravity-tests.pdf).
- Peter J. Mohr, David B. Newell, Barry N. Taylor, and Eite Tiesinga,
  “CODATA recommended values of the fundamental physical constants: 2022,”
  [doi:10.1063/5.0279860](https://doi.org/10.1063/5.0279860).
- Thomas Faulkner and Antony J. Speranza, “Gravitational algebras and the
  generalized second law,” [arXiv:2405.00847](https://arxiv.org/abs/2405.00847).
- Edward Witten, “Gravity and the Crossed Product,”
  [arXiv:2112.12828](https://arxiv.org/abs/2112.12828).

## License

MIT.
