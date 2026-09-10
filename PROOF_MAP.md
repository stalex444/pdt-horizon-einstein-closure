# Proof map for the revised comparison

The principal result begins with geometric generators and proves their full
Lie closure. The companion statements repair or constrain the interpretation.

| Source module | Verified role |
|---|---|
| `ResponseClosureGeometry` | Fixed metric and basis pairs; actual orthogonal-generator brackets; local Hodge complement formula, zero extension, square and local equivariance. |
| `ResponseClosureOrthogonalBasis` | Full spanning, independence and unique coordinates over every field with two nonzero, using exactly the entrywise casts of the displayed geometric generators. |
| `ResponseClosureCertificate` | Integral adjoint/Hodge identities, fourteen derived-operator recipes, all signed skew directions and one symmetric seed. |
| `GravityScreening.SignedLieGeneration` | General field proof propagating the seed to every trace-free matrix; trace-rank dimension formula without division by the matrix size. |
| `GravityScreening.HodgeLieGeneration` | Scalar extension, membership of all derived operators, equality with `sl15` and dimension 224 for every field with two nonzero. |
| `GravityScreening.PdtOpticalRepair` | Actual affine and label derivatives, nullness and screen orthogonality, positive pullback pairing, intrinsic metric evolution, full finite-cut energy balance. |
| `GravityScreening.TwoSidedTraceFree` | Necessary and sufficient scalar-product condition for a two-sided response; explicit diagonal-difference obstruction witnesses. |

`Solution.lean` connects the four displayed Challenge statements to these
modules. The current selected names are given by `comparator.json`.

The older PDT modules retain the root arithmetic, KMS selection premises,
Hodge pair, doubled quadratic action, Gaussian integrals and conditional
local Einstein-tensor consequence. Their existence does not supply the
missing microscopic entropy coefficient or transport the complex
2D divide to a physical 224-dimensional scalar response. The current scope is described
in `PHYSICAL_SCOPE.md`.
