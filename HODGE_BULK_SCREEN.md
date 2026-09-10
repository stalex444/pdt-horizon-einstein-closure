# The Hodge bulk and screen products

> Historical development note. The current selected statements and revised
> interpretation are documented in README.md, PROOF_MAP.md and PHYSICAL_SCOPE.md.

## Result

On one complexified Lorentzian Hodge pair, let `C = -i star` be the
chirality involution and let

```text
P+ = (I+C)/2,     P- = (I-C)/2.
```

Conditionally assign the cubic weight `rho` to one chirality and the quartic
weight `Q` to the other:

```text
D(rho,Q)      = rho P+ + Q P-,
D_flip(rho,Q) = Q P+ + rho P-.
```

Lean proves

```text
D(rho,Q) D_flip(rho,Q) = rho Q I.
```

The joint scalar is therefore the exact orientation-even product of the two
chiral weights.  This is a stronger structural role for the bulk factor than
placing `rho Q` directly into a scalar matrix.

The same file defines a separate normalized response

```text
R(l)      = I + l C,
R_flip(l) = I - l C.
```

Its orientation-paired product is

```text
R(l) R_flip(l) = (1-l^2) I.
```

At `l = lambda4 = 1-1/Q`, Lean proves the arithmetic form

```text
R(lambda4) R_flip(lambda4) = ((2Q-1)/Q^2) I.
```

The compared theorem `HorizonEinsteinClosure.hodgeBulkAndQuarticScreen`
states both products together.  The integrated theorem carries them into the
same result as the horizon balance and local Einstein equation.

## Why the distinction matters

The two identities realize two different factors used in the proposed coupling:

```text
1/alphaG_PDT = (rho Q)^224 (1-lambda4^2) / pi^4.
```

The first product realizes the joint cubic/quartic bulk scalar.  The second
realizes the quartic screen scalar.  The proof does not equate the underlying
operators, so it avoids collapsing the bulk Hodge divide into the horizon
response.

## Exact scope

The operator algebra is kernel-checked.  The assignment of `rho` and `Q` to
opposite curvature chiralities is a physical PDT placement.  The assignment
of the quartic response to a physical horizon is another PDT placement.
Neither follows from the matrix identities alone.

Finite Perron/KMS data exist for both the cubic and quartic companion graphs.
Consequently, finite graph KMS theory does not by itself select `Q` rather
than `rho` as the horizon weight.  This package does not supply a physical or
information-geometric principle selecting `Q` for that boundary role.

## Kernel surface

```text
GravityScreening.hodgeDivide_mul_flip
GravityScreening.hodgeResponse_mul_flip
GravityScreening.hodgeBulkAndQuarticScreen
HorizonEinsteinClosure.hodgeBulkAndQuarticScreen
```

The source file is `GravityScreening/HodgeBulkScreen.lean`.  It contains no
`sorry`, `admit`, or added axiom.

## Operator-algebra source

The finite-graph KMS context is described by Astrid an Huef, Marcelo Laca,
Iain Raeburn, and Aidan Sims, *KMS states on the C*-algebras of finite graphs*:
<https://arxiv.org/abs/1205.2194>.
