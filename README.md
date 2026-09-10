# Hodge-generated response algebras and finite-cut optical balance

This development proves that fifteen explicitly defined orthogonal adjoint
actions, together with one local Lorentz Hodge operation, generate every
trace-free endomorphism of their fifteen-dimensional coordinate space.
The proof works over every field in which two is nonzero. The generated
algebra therefore has dimension 224.

The fixed six-dimensional form is `diag(1,1,1,-1,1,-1)`. The Hodge operation
uses the oriented four-plane `0123` and is zero on the remaining nine
bivectors. The adjoint operators are computed from actual six-by-six
orthogonal-generator commutators. The generated algebra is defined as the
least subspace containing these operators and closed under commutators.
The full trace-free space is the conclusion of the generation theorem.

The mathematical proof and its relation to known representation theory are
in [LIE_GENERATION.md](LIE_GENERATION.md). Its proposed contribution is an
explicit integral generation mechanism, a reusable matrix-unit propagation
lemma, and a uniform field statement. The literature search has not
established global novelty or priority, and no human peer review is claimed.

## Compared results

The Palomar comparison selects four results:

| Declaration in `HorizonEinsteinClosure` | Scope |
|---|---|
| `geometricHodgeGeneration` | The geometrically specified adjoint/Hodge Lie closure equals `sl(15,K)` and has dimension 224, for every field with `2 ≠ 0`. This is the principal result. |
| `orthogonalNullFamily` | An explicit quadratic initial cut gives an affine null family whose actual screen derivatives are orthogonal to the null tangent; its induced screen pairing is positive before degeneracy. |
| `finiteCutOpticalBalance` | Area evolution and the stated optical equation imply an exact interval energy balance with both endpoint expansion terms retained. |
| `twoSidedTraceFreePreservation` | The map `T ↦ DTE` preserves trace-free matrices exactly when `ED` is scalar. |

The companion results correct and constrain the proposed optical/response
interpretation. They are not presented as independent new laws of gravity.
The previous seven-result conditional development remains in the supporting
source and Git history; the new comparison leads with the generation result.

## Relation to PDT gravity

Stephanie Alexander's PDT proposal motivates the operator choice and the
cubic/quartic parameters `rho^3=rho+1`, `Q^4=Q+1`. This revision establishes
what the specified operator closure forces mathematically. Physical selection
of those operators remains a premise. Identifying the physical algebra with
this least generated algebra, or imposing trace-free containment, is also
necessary to infer that its dimension is exactly224: generator inclusion
and commutator closure alone also allow larger algebras such as `gl15`.

The generation theorem does not determine a scalar response on the resulting
algebra, an absolute horizon-entropy coefficient, or Newton's constant.
In particular, the original complex two-dimensional Hodge divide does not
automatically extend to a response on all fifteen generator directions.
The new two-sided preservation theorem states the exact condition that any
such construction must meet. See [PHYSICAL_SCOPE.md](PHYSICAL_SCOPE.md).

The optical repair uses the full evolving shear-minus-expansion density.
Its finite-cut charge is `A(u)-u A(u) theta(u)`. A physical modular-energy
interpretation also needs a state, gravitational constraints and boundary
conditions; it does not follow from this flat-coordinate construction.
The existing local Clausius-to-Einstein algebra remains conditional on its
independent thermodynamic premise.

## Reproduction and provenance

```sh
lake build
python3 scripts/check_render_statements.py
```

Lean 4.31.0 and the Mathlib revision in `lake-manifest.json` are pinned.
`Challenge.lean` imports only Mathlib and has complete ordinary definitions;
`Solution.lean` proves the selected statements from the source modules.
The theorem statement definitions are fixed dependencies, and
`comparator.json` has an empty `definition_names` list. Every complete
statement is repeated exactly in its theorem documentation so the partial
reviewer view exposes the quantified claim. See
[RENDER_COMPATIBILITY.md](RENDER_COMPATIBILITY.md).

The finite identities use kernel-checked matrix-unit arithmetic. The proofs
use only `propext`, `Classical.choice`, and `Quot.sound`; no native computation
axiom is required. AI agents assisted with theorem design, exact exploratory
calculations, Lean proofs, literature checks and integration under Stephanie
Alexander's direction. Source relationships and limitations are recorded in
[formalization.yaml](formalization.yaml) and [PROOF_MAP.md](PROOF_MAP.md).

New public commits require their own Palomar verification and editorial
review. Local proof checking does not establish acceptance or experimental
validation.
