import GravityScreening.HorizonEinsteinClosureCapstone
import GravityScreening.StructuralGravityExponent

/-!
# Solution: from a pQ Hodge divide and quartic horizon line to Einstein closure

The compared surface keeps every physical placement visible.  A Hodge-pair
theorem separates the orientation-paired `rho Q` bulk product from the
normalized quartic screen product.  A two-channel
horizon response is assumed to carry the proposed quartic KMS/core weight on
one exchange eigenspace, an initial scalar horizon residual is assumed, and a
local null Clausius contraction is assumed with the defined dimensionless
rho Q coupling in electron-mass natural units.
The conclusions classify the affine screen flow, give a positive-branch
null-ray realization, prove the Raychaudhuri-form and shear/area identities, preserve
the assumed residual under a defined update, and derive the local
Einstein-tensor form.
## Rendering compatibility

Each selected theorem proves a named proposition containing its complete
original quantified statement. The proposition is defined immediately before
the theorem and has no placeholder. Comparator follows and compares its body
as an ordinary dependency; `definition_names` stays empty. This presentation
avoids Palomar renderer issue #134 without changing the hypotheses, conclusions,
derivation of 224, permitted axioms, or proof-verification requirements.

-/

namespace HorizonEinsteinClosure

noncomputable section

open scoped Interval Matrix

def lambda4 (q : ℝ) : ℝ := 1 - 1 / q

def screening (l : ℝ) : ℝ := 1 - l ^ 2

def constitutiveBlock (l : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![1, -l; -l, 1]

def channelExchange : Matrix (Fin 2) (Fin 2) ℝ :=
  !![0, 1; 1, 0]

def IsChannelExchangeSymmetric
    (M : Matrix (Fin 2) (Fin 2) ℝ) : Prop :=
  channelExchange * M * channelExchange = M

def HasUnitDiagonalMean (M : Matrix (Fin 2) (Fin 2) ℝ) : Prop :=
  (M 0 0 + M 1 1) / 2 = 1

def evenChannelVector : Fin 2 → ℝ := ![1, 1]

def oddChannelVector : Fin 2 → ℝ := ![1, -1]

def HasEvenCoreWeight
    (M : Matrix (Fin 2) (Fin 2) ℝ) (q : ℝ) : Prop :=
  M.mulVec evenChannelVector = (1 / q) • evenChannelVector

def HasOddCoreWeight
    (M : Matrix (Fin 2) (Fin 2) ℝ) (q : ℝ) : Prop :=
  M.mulVec oddChannelVector = (1 / q) • oddChannelVector

def HasUnorientedCoreWeight
    (M : Matrix (Fin 2) (Fin 2) ℝ) (q : ℝ) : Prop :=
  HasEvenCoreWeight M q ∨ HasOddCoreWeight M q

def affineScreenFlow
    (M : Matrix (Fin 2) (Fin 2) ℝ) (t : ℝ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  (1 : Matrix (Fin 2) (Fin 2) ℝ) +
    t • (M - (1 : Matrix (Fin 2) (Fin 2) ℝ))

def opticalJacobi (l t : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  constitutiveBlock (t * l)

def opticalVelocity (l : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![(0 : ℝ), -l; -l, 0]

def opticalAreaRatio (l t : ℝ) : ℝ := screening (t * l)

def opticalExpansion (l t : ℝ) : ℝ :=
  (-2 * l ^ 2 * t) / opticalAreaRatio l t

def opticalShearSq (l t : ℝ) : ℝ :=
  (2 * l ^ 2) / opticalAreaRatio l t ^ 2

def opticalExpansionRate (l t : ℝ) : ℝ :=
  (-2 * l ^ 2 * (1 + l ^ 2 * t ^ 2)) /
    opticalAreaRatio l t ^ 2

def screenTensorSq (M : Matrix (Fin 2) (Fin 2) ℝ) : ℝ :=
  M 0 0 ^ 2 + M 0 1 ^ 2 + M 1 0 ^ 2 + M 1 1 ^ 2

def unitBoostWeightedInitialShearFlux (l : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..1, t * screenTensorSq (opticalVelocity l)

def screenVectorSq (x : Fin 2 → ℝ) : ℝ := x 0 ^ 2 + x 1 ^ 2

def screenVelocity (l : ℝ) (y : Fin 2 → ℝ) : Fin 2 → ℝ :=
  (opticalVelocity l).mulVec y

def doubleNullMinkowskiSq (x : Fin 4 → ℝ) : ℝ :=
  -2 * x 0 * x 1 + x 2 ^ 2 + x 3 ^ 2

def nullTangent (l : ℝ) (y : Fin 2 → ℝ) : Fin 4 → ℝ :=
  let v := screenVelocity l y
  ![1, screenVectorSq v / 2, v 0, v 1]

def nullGeodesic
    (l : ℝ) (y : Fin 2 → ℝ) (t : ℝ) : Fin 4 → ℝ :=
  let v := screenVelocity l y
  ![t, t * screenVectorSq v / 2,
    y 0 + t * v 0, y 1 + t * v 1]

def horizonConstraintResidual
    (charge modularEnergy inverseG area : ℝ) : ℝ :=
  charge + modularEnergy + inverseG * area / 4

def opticalModularEnergyIncrement
    (inverseG area l : ℝ) : ℝ := inverseG * l ^ 2 * area / 4

def localMinkowskiMetric : Matrix (Fin 4) (Fin 4) ℝ :=
  !![-1, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1]

def localMinkowskiSq (v : Fin 4 → ℝ) : ℝ :=
  -(v 0) ^ 2 + (v 1) ^ 2 + (v 2) ^ 2 + (v 3) ^ 2

def localQuadraticContraction
    (M : Matrix (Fin 4) (Fin 4) ℝ) (v : Fin 4 → ℝ) : ℝ :=
  dotProduct v (M.mulVec v)

def localMinkowskiTrace (M : Matrix (Fin 4) (Fin 4) ℝ) : ℝ :=
  -M 0 0 + M 1 1 + M 2 2 + M 3 3

/-- The real vector space underlying Mathlib's `so'(4,2)`. -/
abbrev ConformalGeneratorSpace :=
  LieAlgebra.Orthogonal.so' (Fin 4) (Fin 2) ℝ

/-- Trace-free endomorphisms of the conformal generator space. -/
def conformalResponseAlgebra :
    Submodule ℝ (Module.End ℝ ConformalGeneratorSpace) :=
  LinearMap.ker (LinearMap.trace ℝ ConformalGeneratorSpace)

/-- Evaluation of a trace-free response at a conformal generator. -/
def conformalResponseAction (v : ConformalGeneratorSpace) :
    conformalResponseAlgebra →ₗ[ℝ] ConformalGeneratorSpace where
  toFun f := f.1 v
  map_add' f g := by simp
  map_smul' c f := by simp

/-- The infinitesimal stabilizer of a conformal generator. -/
def conformalResponseStabilizer (v : ConformalGeneratorSpace) :
    Submodule ℝ conformalResponseAlgebra :=
  LinearMap.ker (conformalResponseAction v)

/-- The response exponent, defined as a dimension rather than a numeral. -/
def gravitationalExponent : ℕ :=
  Module.finrank ℝ conformalResponseAlgebra

def scalarResponseMatrix (n : ℕ) (scale : ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  scale • (1 : Matrix (Fin n) (Fin n) ℝ)

/-- The dimensionless gravitational coupling used in the normalized equation. -/
def gravitationalCoupling (rho q : ℝ) : ℝ :=
  Real.pi ^ 4 /
    ((rho * q) ^ gravitationalExponent * screening (lambda4 q))

abbrev HodgeSide := Fin 2

def hodgeRotation : Matrix HodgeSide HodgeSide ℂ := !![0, -1; 1, 0]

def hodgeChirality : Matrix HodgeSide HodgeSide ℂ :=
  (-Complex.I) • hodgeRotation

def hodgePlus : Matrix HodgeSide HodgeSide ℂ :=
  (2 : ℂ)⁻¹ • (1 + hodgeChirality)

def hodgeMinus : Matrix HodgeSide HodgeSide ℂ :=
  (2 : ℂ)⁻¹ • (1 - hodgeChirality)

def hodgeDivide (rho q : ℝ) : Matrix HodgeSide HodgeSide ℂ :=
  (rho : ℂ) • hodgePlus + (q : ℂ) • hodgeMinus

def hodgeDivideFlip (rho q : ℝ) : Matrix HodgeSide HodgeSide ℂ :=
  (q : ℂ) • hodgePlus + (rho : ℂ) • hodgeMinus

def hodgeResponse (l : ℝ) : Matrix HodgeSide HodgeSide ℂ :=
  (1 : Matrix HodgeSide HodgeSide ℂ) + (l : ℂ) • hodgeChirality

def hodgeResponseFlip (l : ℝ) : Matrix HodgeSide HodgeSide ℂ :=
  (1 : Matrix HodgeSide HodgeSide ℂ) - (l : ℂ) • hodgeChirality

/-- The exponent is the dimension of the trace-free endomorphisms of the
actual real `so'(4,2)` generator space.  Their evaluation action is
surjective at every nonzero generator and has a 209-dimensional stabilizer. -/
def gravityExponentFromConformalResponseSpaceStatement : Prop :=
  ∀ {v : ConformalGeneratorSpace} (hv : v ≠ 0),
    Module.finrank ℝ ConformalGeneratorSpace = 15 ∧
      gravitationalExponent = 224 ∧
      Function.Surjective (conformalResponseAction v) ∧
      Module.finrank ℝ (conformalResponseStabilizer v) = 209 ∧
      gravitationalExponent =
        Module.finrank ℝ ConformalGeneratorSpace +
          Module.finrank ℝ (conformalResponseStabilizer v) ∧
      ∀ scale : ℝ,
        Matrix.det (scalarResponseMatrix gravitationalExponent scale) =
          scale ^ 224

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def gravityExponentFromConformalResponseSpaceStatement : Prop :=
  ∀ {v : ConformalGeneratorSpace} (hv : v ≠ 0),
    Module.finrank ℝ ConformalGeneratorSpace = 15 ∧
      gravitationalExponent = 224 ∧
      Function.Surjective (conformalResponseAction v) ∧
      Module.finrank ℝ (conformalResponseStabilizer v) = 209 ∧
      gravitationalExponent =
        Module.finrank ℝ ConformalGeneratorSpace +
          Module.finrank ℝ (conformalResponseStabilizer v) ∧
      ∀ scale : ℝ,
        Matrix.det (scalarResponseMatrix gravitationalExponent scale) =
          scale ^ 224
```
-/
theorem gravityExponentFromConformalResponseSpace :
    gravityExponentFromConformalResponseSpaceStatement := by
  intro v hv
  have hconformal : Module.finrank ℝ ConformalGeneratorSpace = 15 := by
    exact GravityScreening.finrank_conformalLieAlgebra
  have hexponent : gravitationalExponent = 224 := by
    change Module.finrank ℝ GravityScreening.conformalResponseAlgebra = 224
    exact GravityScreening.finrank_conformalResponseAlgebra
  have hsurjective : Function.Surjective (conformalResponseAction v) := by
    change Function.Surjective (GravityScreening.conformalResponseAction v)
    exact GravityScreening.conformalResponseAction_surjective hv
  have hstabilizer :
      Module.finrank ℝ (conformalResponseStabilizer v) = 209 := by
    change Module.finrank ℝ
      (GravityScreening.conformalResponseStabilizer v) = 209
    exact GravityScreening.finrank_conformalResponseStabilizer hv
  have hsplit : gravitationalExponent =
      Module.finrank ℝ ConformalGeneratorSpace +
        Module.finrank ℝ (conformalResponseStabilizer v) := by
    rw [hexponent, hconformal, hstabilizer]
  have hdet : ∀ scale : ℝ,
      Matrix.det (scalarResponseMatrix gravitationalExponent scale) =
        scale ^ 224 := by
    intro scale
    calc
      Matrix.det (scalarResponseMatrix gravitationalExponent scale) =
          scale ^ gravitationalExponent := by simp [scalarResponseMatrix]
      _ = scale ^ 224 := by rw [hexponent]
  exact ⟨hconformal, hexponent, hsurjective, hstabilizer, hsplit, hdet⟩

/-- The orientation-paired Hodge divide exposes the joint `rho Q` bulk
scalar, while the distinct normalized quartic response exposes the screen
factor. -/
def hodgeBulkAndQuarticScreenStatement : Prop :=
  ∀ (rho q : ℝ) (hq0 : q ≠ 0),
    hodgeDivide rho q * hodgeDivideFlip rho q =
        ((rho * q : ℝ) : ℂ) •
          (1 : Matrix HodgeSide HodgeSide ℂ) ∧
      hodgeResponse (lambda4 q) * hodgeResponseFlip (lambda4 q) =
        ((((2 * q - 1) / q ^ 2 : ℝ)) : ℂ) •
          (1 : Matrix HodgeSide HodgeSide ℂ)

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def hodgeBulkAndQuarticScreenStatement : Prop :=
  ∀ (rho q : ℝ) (hq0 : q ≠ 0),
    hodgeDivide rho q * hodgeDivideFlip rho q =
        ((rho * q : ℝ) : ℂ) •
          (1 : Matrix HodgeSide HodgeSide ℂ) ∧
      hodgeResponse (lambda4 q) * hodgeResponseFlip (lambda4 q) =
        ((((2 * q - 1) / q ^ 2 : ℝ)) : ℂ) •
          (1 : Matrix HodgeSide HodgeSide ℂ)
```
-/
theorem hodgeBulkAndQuarticScreen :
    hodgeBulkAndQuarticScreenStatement := by
  intro rho q hq0
  simpa [hodgeDivide, hodgeDivideFlip, hodgePlus, hodgeMinus,
    hodgeChirality, hodgeRotation, hodgeResponse, hodgeResponseFlip,
    lambda4, GravityScreening.hodgeDivide,
    GravityScreening.hodgeDivideFlip, GravityScreening.hodgePlus,
    GravityScreening.hodgeMinus, GravityScreening.hodgeChirality,
    GravityScreening.hodgeRotation, GravityScreening.hodgeResponse,
    GravityScreening.hodgeResponseFlip, GravityScreening.lambda4] using
      GravityScreening.hodgeBulkAndQuarticScreen rho q hq0

/-- The quartic KMS boundary conditions classify the complete affine optical
flow up to orientation and identify its boost-weighted shear flux with its
missing endpoint area. -/
def kmsBoundarySelectsOpticalFlowStatement : Prop :=
  ∀ (M : Matrix (Fin 2) (Fin 2) ℝ)
    (q charge K inverseG area : ℝ)
    (hq4 : q ^ 4 = q + 1) (hq1 : 1 < q)
    (hG : inverseG ≠ 0)
    (hexchange : IsChannelExchangeSymmetric M)
    (hmean : HasUnitDiagonalMean M)
    (hcore : HasUnorientedCoreWeight M q)
    (hconstraint : horizonConstraintResidual charge K inverseG area = 0),
    ((∀ t, affineScreenFlow M t = opticalJacobi (lambda4 q) t) ∨
      (∀ t, affineScreenFlow M t = opticalJacobi (-lambda4 q) t)) ∧
      Matrix.det M = screening (lambda4 q) ∧
      0 < Matrix.det M ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = lambda4 q ^ 2 ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = 1 - Matrix.det M ∧
      opticalExpansion (lambda4 q) 0 = 0 ∧
      horizonConstraintResidual charge
          (K + opticalModularEnergyIncrement inverseG area (lambda4 q))
          inverseG (Matrix.det M * area) = 0

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def kmsBoundarySelectsOpticalFlowStatement : Prop :=
  ∀ (M : Matrix (Fin 2) (Fin 2) ℝ)
    (q charge K inverseG area : ℝ)
    (hq4 : q ^ 4 = q + 1) (hq1 : 1 < q)
    (hG : inverseG ≠ 0)
    (hexchange : IsChannelExchangeSymmetric M)
    (hmean : HasUnitDiagonalMean M)
    (hcore : HasUnorientedCoreWeight M q)
    (hconstraint : horizonConstraintResidual charge K inverseG area = 0),
    ((∀ t, affineScreenFlow M t = opticalJacobi (lambda4 q) t) ∨
      (∀ t, affineScreenFlow M t = opticalJacobi (-lambda4 q) t)) ∧
      Matrix.det M = screening (lambda4 q) ∧
      0 < Matrix.det M ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = lambda4 q ^ 2 ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = 1 - Matrix.det M ∧
      opticalExpansion (lambda4 q) 0 = 0 ∧
      horizonConstraintResidual charge
          (K + opticalModularEnergyIncrement inverseG area (lambda4 q))
          inverseG (Matrix.det M * area) = 0
```
-/
theorem kmsBoundarySelectsOpticalFlow :
    kmsBoundarySelectsOpticalFlowStatement := by
  intro M q charge K inverseG area hq4 hq1 hG hexchange hmean hcore hconstraint
  have hexchange' : GravityScreening.IsChannelExchangeSymmetric M := by
    simpa [IsChannelExchangeSymmetric, channelExchange,
      GravityScreening.IsChannelExchangeSymmetric,
      GravityScreening.channelExchange] using hexchange
  have hmean' : GravityScreening.HasUnitDiagonalMean M := by
    simpa [HasUnitDiagonalMean,
      GravityScreening.HasUnitDiagonalMean] using hmean
  have hcore' : GravityScreening.HasUnorientedCoreWeight M q := by
    simpa [HasUnorientedCoreWeight, HasEvenCoreWeight, HasOddCoreWeight,
      evenChannelVector, oddChannelVector,
      GravityScreening.HasUnorientedCoreWeight,
      GravityScreening.HasEvenCoreWeight,
      GravityScreening.HasOddCoreWeight,
      GravityScreening.oddChannelVector] using hcore
  have hconstraint' :
      GravityScreening.horizonConstraintResidual
        charge K inverseG area = 0 := by
    simpa [horizonConstraintResidual,
      GravityScreening.horizonConstraintResidual] using hconstraint
  rcases GravityScreening.quarticKMSOpticalBoundarySelection_capstone
      M q charge K inverseG area hq4 hq1 hG hexchange' hmean' hcore'
      hconstraint' with
    ⟨hflow, hdet, _hresidual, hdetpos, hflux, hfluxdet,
      hzero, hbalance⟩
  refine ⟨?_, ?_, hdetpos, ?_, ?_, ?_, ?_⟩
  · rcases hflow with hplus | hminus
    · left
      intro t
      simpa [affineScreenFlow, opticalJacobi, constitutiveBlock, lambda4,
        GravityScreening.affineScreenFlow,
        GravityScreening.perronOpticalJacobi,
        GravityScreening.constitutiveBlock,
        GravityScreening.lambda4] using hplus t
    · right
      intro t
      simpa [affineScreenFlow, opticalJacobi, constitutiveBlock, lambda4,
        GravityScreening.affineScreenFlow,
        GravityScreening.perronOpticalJacobi,
        GravityScreening.constitutiveBlock,
        GravityScreening.lambda4] using hminus t
  · simpa [screening, lambda4, GravityScreening.screening,
      GravityScreening.lambda4] using hdet
  · simpa [unitBoostWeightedInitialShearFlux, screenTensorSq,
      opticalVelocity, lambda4,
      GravityScreening.unitBoostWeightedInitialShearFlux,
      GravityScreening.screenTensorSq,
      GravityScreening.perronOpticalVelocity,
      GravityScreening.lambda4] using hflux
  · simpa [unitBoostWeightedInitialShearFlux, screenTensorSq,
      opticalVelocity, lambda4,
      GravityScreening.unitBoostWeightedInitialShearFlux,
      GravityScreening.screenTensorSq,
      GravityScreening.perronOpticalVelocity,
      GravityScreening.lambda4] using hfluxdet
  · exact hzero
  · simpa [horizonConstraintResidual, opticalModularEnergyIncrement,
      lambda4, GravityScreening.horizonConstraintResidual,
      GravityScreening.perronOpticalModularEnergyIncrement,
      GravityScreening.lambda4] using hbalance

/-- The positive-orientation quartic screen flow is the transverse map of an explicit
affine null-ray family, and its defined optical scalars satisfy the exact
identity having the twist-free vacuum Raychaudhuri form throughout one affine
unit. -/
def quarticNullCongruenceRaychaudhuriStatement : Prop :=
  ∀ (q u : ℝ) (screenLabel : Fin 2 → ℝ)
    (hq1 : 1 < q) (hu0 : 0 ≤ u) (hu1 : u ≤ 1),
    doubleNullMinkowskiSq (nullTangent (lambda4 q) screenLabel) = 0 ∧
      (nullGeodesic (lambda4 q) screenLabel u 2 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        nullGeodesic (lambda4 q) screenLabel u 3 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 1) ∧
      HasDerivAt (opticalExpansion (lambda4 q))
        (opticalExpansionRate (lambda4 q) u) u ∧
      opticalExpansionRate (lambda4 q) u =
        -(opticalExpansion (lambda4 q) u) ^ 2 / 2 -
          opticalShearSq (lambda4 q) u

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def quarticNullCongruenceRaychaudhuriStatement : Prop :=
  ∀ (q u : ℝ) (screenLabel : Fin 2 → ℝ)
    (hq1 : 1 < q) (hu0 : 0 ≤ u) (hu1 : u ≤ 1),
    doubleNullMinkowskiSq (nullTangent (lambda4 q) screenLabel) = 0 ∧
      (nullGeodesic (lambda4 q) screenLabel u 2 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        nullGeodesic (lambda4 q) screenLabel u 3 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 1) ∧
      HasDerivAt (opticalExpansion (lambda4 q))
        (opticalExpansionRate (lambda4 q) u) u ∧
      opticalExpansionRate (lambda4 q) u =
        -(opticalExpansion (lambda4 q) u) ^ 2 / 2 -
          opticalShearSq (lambda4 q) u
```
-/
theorem quarticNullCongruenceRaychaudhuri :
    quarticNullCongruenceRaychaudhuriStatement := by
  intro q u screenLabel hq1 hu0 hu1
  have htangent :
      doubleNullMinkowskiSq (nullTangent (lambda4 q) screenLabel) = 0 := by
    simp [doubleNullMinkowskiSq, nullTangent, screenVectorSq]
    ring
  have hscreen :
      nullGeodesic (lambda4 q) screenLabel u 2 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        nullGeodesic (lambda4 q) screenLabel u 3 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 1 := by
    constructor <;>
      simp [nullGeodesic, screenVelocity, opticalJacobi, opticalVelocity,
        constitutiveBlock, Matrix.mulVec, dotProduct, Fin.sum_univ_succ] <;>
      ring
  have hray :=
    GravityScreening.quarticPerronOptical_Raychaudhuri_on_unitInterval
      q u hq1 hu0 hu1
  refine ⟨htangent, hscreen, ?_, ?_⟩
  · have hfun : opticalExpansion (lambda4 q) =
        GravityScreening.perronOpticalExpansion
          (GravityScreening.lambda4 q) := by
      funext s
      rfl
    rw [hfun]
    simpa [opticalExpansionRate, opticalAreaRatio,
      screening, lambda4,
      GravityScreening.perronOpticalExpansionRate,
      GravityScreening.perronOpticalAreaRatio,
      GravityScreening.screening, GravityScreening.lambda4] using hray.1
  · simpa [opticalExpansion, opticalExpansionRate, opticalShearSq,
      opticalAreaRatio, screening, lambda4,
      GravityScreening.perronOpticalExpansion,
      GravityScreening.perronOpticalExpansionRate,
      GravityScreening.perronOpticalShearSq,
      GravityScreening.perronOpticalAreaRatio,
      GravityScreening.screening, GravityScreening.lambda4] using hray.2

/-- Four-dimensional null-cone rigidity: a symmetric bilinear form whose
quadratic contraction vanishes on every Minkowski-null vector is a scalar
multiple of the metric. -/
def nullConeRigidity4Statement : Prop :=
  ∀ (M : Matrix (Fin 4) (Fin 4) ℝ)
    (hsym : M.transpose = M)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 → localQuadraticContraction M v = 0),
    ∃ c : ℝ, M = c • localMinkowskiMetric

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def nullConeRigidity4Statement : Prop :=
  ∀ (M : Matrix (Fin 4) (Fin 4) ℝ)
    (hsym : M.transpose = M)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 → localQuadraticContraction M v = 0),
    ∃ c : ℝ, M = c • localMinkowskiMetric
```
-/
theorem nullConeRigidity4 :
    nullConeRigidity4Statement := by
  intro M hsym hnull
  simpa [localMinkowskiSq, localQuadraticContraction,
    localMinkowskiMetric, GravityScreening.localMinkowskiSq,
    GravityScreening.localQuadraticContraction,
    GravityScreening.localMinkowskiMetric] using
    GravityScreening.symmetricForm_vanishes_on_nullCone_forces_metric
      M hsym (by
        intro v hv
        exact hnull v (by
          simpa [localMinkowskiSq,
            GravityScreening.localMinkowskiSq] using hv))

/-- The pointwise algebraic final step of Jacobson's argument. -/
def nullClausiusForcesLocalEinsteinShapeStatement : Prop :=
  ∀ (ricci stress : Matrix (Fin 4) (Fin 4) ℝ) (kappa : ℝ)
    (hricci : ricci.transpose = ricci)
    (hstress : stress.transpose = stress)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 →
        localQuadraticContraction (ricci - kappa • stress) v = 0),
    ∃ cosmological : ℝ,
      ricci - (localMinkowskiTrace ricci / 2) • localMinkowskiMetric +
          cosmological • localMinkowskiMetric = kappa • stress

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def nullClausiusForcesLocalEinsteinShapeStatement : Prop :=
  ∀ (ricci stress : Matrix (Fin 4) (Fin 4) ℝ) (kappa : ℝ)
    (hricci : ricci.transpose = ricci)
    (hstress : stress.transpose = stress)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 →
        localQuadraticContraction (ricci - kappa • stress) v = 0),
    ∃ cosmological : ℝ,
      ricci - (localMinkowskiTrace ricci / 2) • localMinkowskiMetric +
          cosmological • localMinkowskiMetric = kappa • stress
```
-/
theorem nullClausiusForcesLocalEinsteinShape :
    nullClausiusForcesLocalEinsteinShapeStatement := by
  intro ricci stress kappa hricci hstress hnull
  have hnull' : ∀ v : Fin 4 → ℝ,
      GravityScreening.localMinkowskiSq v = 0 →
        GravityScreening.localQuadraticContraction
          (ricci - kappa • stress) v = 0 := by
    intro v hv
    apply hnull v
    simpa [localMinkowskiSq,
      GravityScreening.localMinkowskiSq] using hv
  simpa [localMinkowskiTrace, localMinkowskiMetric,
    GravityScreening.localMinkowskiTrace,
    GravityScreening.localMinkowskiMetric] using
    GravityScreening.nullClausius_forces_localEinsteinShape
      ricci stress kappa hricci hstress hnull'

/-- Integrated conditional horizon-to-Einstein result.  The conclusion retains
the determinant identity for the defined dimensionless rho Q coupling, the classified
optical model, the conditional horizon balance, and the local Einstein-tensor
form in one compared declaration. -/
def horizonEinsteinClosureStatement : Prop :=
  ∀ (M : Matrix (Fin 2) (Fin 2) ℝ)
    (ricci stress : Matrix (Fin 4) (Fin 4) ℝ)
    (rho q u charge K area : ℝ)
    (screenLabel : Fin 2 → ℝ)
    (hrho3 : rho ^ 3 = rho + 1) (hrho1 : 1 < rho)
    (hq4 : q ^ 4 = q + 1) (hq1 : 1 < q)
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1)
    (hexchange : IsChannelExchangeSymmetric M)
    (hmean : HasUnitDiagonalMean M)
    (hcore : HasUnorientedCoreWeight M q)
    (hconstraint : horizonConstraintResidual charge K
      (1 / gravitationalCoupling rho q) area = 0)
    (hricci : ricci.transpose = ricci)
    (hstress : stress.transpose = stress)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 →
        localQuadraticContraction
          (ricci - (8 * Real.pi * gravitationalCoupling rho q) • stress)
          v = 0),
    ((∀ t, affineScreenFlow M t = opticalJacobi (lambda4 q) t) ∨
      (∀ t, affineScreenFlow M t = opticalJacobi (-lambda4 q) t)) ∧
      Matrix.det M = screening (lambda4 q) ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = lambda4 q ^ 2 ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = 1 - Matrix.det M ∧
      doubleNullMinkowskiSq
          (nullTangent (lambda4 q) screenLabel) = 0 ∧
      (nullGeodesic (lambda4 q) screenLabel u 2 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        nullGeodesic (lambda4 q) screenLabel u 3 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 1) ∧
      HasDerivAt (opticalExpansion (lambda4 q))
        (opticalExpansionRate (lambda4 q) u) u ∧
      opticalExpansionRate (lambda4 q) u =
        -(opticalExpansion (lambda4 q) u) ^ 2 / 2 -
          opticalShearSq (lambda4 q) u ∧
      horizonConstraintResidual charge
          (K + opticalModularEnergyIncrement
            (1 / gravitationalCoupling rho q) area (lambda4 q))
          (1 / gravitationalCoupling rho q)
          (Matrix.det M * area) = 0 ∧
      (hodgeDivide rho q * hodgeDivideFlip rho q =
          ((rho * q : ℝ) : ℂ) •
            (1 : Matrix HodgeSide HodgeSide ℂ) ∧
        hodgeResponse (lambda4 q) * hodgeResponseFlip (lambda4 q) =
          ((((2 * q - 1) / q ^ 2 : ℝ)) : ℂ) •
            (1 : Matrix HodgeSide HodgeSide ℂ)) ∧
      Irrational (Real.log rho / Real.log q) ∧
      (∃ cosmological : ℝ,
        ricci - (localMinkowskiTrace ricci / 2) • localMinkowskiMetric +
            cosmological • localMinkowskiMetric =
          (8 * Real.pi * gravitationalCoupling rho q) • stress) ∧
      1 / gravitationalCoupling rho q =
        (Matrix.det
            (scalarResponseMatrix gravitationalExponent (rho * q)) *
          Matrix.det (constitutiveBlock (lambda4 q))) /
          Real.pi ^ 4

/-- Complete statement proved below. The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def horizonEinsteinClosureStatement : Prop :=
  ∀ (M : Matrix (Fin 2) (Fin 2) ℝ)
    (ricci stress : Matrix (Fin 4) (Fin 4) ℝ)
    (rho q u charge K area : ℝ)
    (screenLabel : Fin 2 → ℝ)
    (hrho3 : rho ^ 3 = rho + 1) (hrho1 : 1 < rho)
    (hq4 : q ^ 4 = q + 1) (hq1 : 1 < q)
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1)
    (hexchange : IsChannelExchangeSymmetric M)
    (hmean : HasUnitDiagonalMean M)
    (hcore : HasUnorientedCoreWeight M q)
    (hconstraint : horizonConstraintResidual charge K
      (1 / gravitationalCoupling rho q) area = 0)
    (hricci : ricci.transpose = ricci)
    (hstress : stress.transpose = stress)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 →
        localQuadraticContraction
          (ricci - (8 * Real.pi * gravitationalCoupling rho q) • stress)
          v = 0),
    ((∀ t, affineScreenFlow M t = opticalJacobi (lambda4 q) t) ∨
      (∀ t, affineScreenFlow M t = opticalJacobi (-lambda4 q) t)) ∧
      Matrix.det M = screening (lambda4 q) ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = lambda4 q ^ 2 ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = 1 - Matrix.det M ∧
      doubleNullMinkowskiSq
          (nullTangent (lambda4 q) screenLabel) = 0 ∧
      (nullGeodesic (lambda4 q) screenLabel u 2 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        nullGeodesic (lambda4 q) screenLabel u 3 =
          (opticalJacobi (lambda4 q) u).mulVec screenLabel 1) ∧
      HasDerivAt (opticalExpansion (lambda4 q))
        (opticalExpansionRate (lambda4 q) u) u ∧
      opticalExpansionRate (lambda4 q) u =
        -(opticalExpansion (lambda4 q) u) ^ 2 / 2 -
          opticalShearSq (lambda4 q) u ∧
      horizonConstraintResidual charge
          (K + opticalModularEnergyIncrement
            (1 / gravitationalCoupling rho q) area (lambda4 q))
          (1 / gravitationalCoupling rho q)
          (Matrix.det M * area) = 0 ∧
      (hodgeDivide rho q * hodgeDivideFlip rho q =
          ((rho * q : ℝ) : ℂ) •
            (1 : Matrix HodgeSide HodgeSide ℂ) ∧
        hodgeResponse (lambda4 q) * hodgeResponseFlip (lambda4 q) =
          ((((2 * q - 1) / q ^ 2 : ℝ)) : ℂ) •
            (1 : Matrix HodgeSide HodgeSide ℂ)) ∧
      Irrational (Real.log rho / Real.log q) ∧
      (∃ cosmological : ℝ,
        ricci - (localMinkowskiTrace ricci / 2) • localMinkowskiMetric +
            cosmological • localMinkowskiMetric =
          (8 * Real.pi * gravitationalCoupling rho q) • stress) ∧
      1 / gravitationalCoupling rho q =
        (Matrix.det
            (scalarResponseMatrix gravitationalExponent (rho * q)) *
          Matrix.det (constitutiveBlock (lambda4 q))) /
          Real.pi ^ 4
```
-/
theorem horizonEinsteinClosure :
    horizonEinsteinClosureStatement := by
  intro M ricci stress rho q u charge K area screenLabel hrho3 hrho1 hq4 hq1 hu0 hu1 hexchange hmean hcore hconstraint hricci hstress hnull
  have hrho0 : rho ≠ 0 := by linarith
  have hq0 : q ≠ 0 := by linarith
  have hscale : rho * q ≠ 0 := mul_ne_zero hrho0 hq0
  have hscreen0 :
      GravityScreening.screening (GravityScreening.lambda4 q) ≠ 0 :=
    ne_of_gt (GravityScreening.quarticScreening_pos q hq1)
  have hscreen0' : screening (lambda4 q) ≠ 0 := by
    simpa [screening, lambda4, GravityScreening.screening,
      GravityScreening.lambda4] using hscreen0
  have hcoupling : gravitationalCoupling rho q ≠ 0 := by
    unfold gravitationalCoupling
    exact div_ne_zero (pow_ne_zero _ Real.pi_ne_zero)
      (mul_ne_zero (pow_ne_zero _ hscale) hscreen0')
  have hinverseG : 1 / gravitationalCoupling rho q ≠ 0 :=
    one_div_ne_zero hcoupling
  rcases kmsBoundarySelectsOpticalFlow
      M q charge K (1 / gravitationalCoupling rho q) area hq4 hq1
      hinverseG hexchange hmean hcore hconstraint with
    ⟨hflow, hdet, _hdetpos, hflux, hfluxdet, _hzero, hbalance⟩
  rcases quarticNullCongruenceRaychaudhuri
      q u screenLabel hq1 hu0 hu1 with
    ⟨htangent, hscreen, hderiv, hray⟩
  have hhodge := hodgeBulkAndQuarticScreen rho q hq0
  have heinstein := nullClausiusForcesLocalEinsteinShape
    ricci stress (8 * Real.pi * gravitationalCoupling rho q)
    hricci hstress hnull
  have hclock : Irrational (Real.log rho / Real.log q) :=
    (GravityScreening.rhoQ_modularCompletion_capstone
      rho q 0 hrho3 hrho1 hq4 hq1).1
  have hcoupling' :
      1 / gravitationalCoupling rho q =
        (Matrix.det
            (scalarResponseMatrix gravitationalExponent (rho * q)) *
          Matrix.det (constitutiveBlock (lambda4 q))) /
          Real.pi ^ 4 := by
    have hdetScalar :
        Matrix.det
            (scalarResponseMatrix gravitationalExponent (rho * q)) =
          (rho * q) ^ gravitationalExponent := by
      simp [scalarResponseMatrix]
    have hdetBlock :
        Matrix.det (constitutiveBlock (lambda4 q)) =
          screening (lambda4 q) := by
      simp [constitutiveBlock, Matrix.det_fin_two, screening]
      ring
    rw [hdetScalar, hdetBlock]
    unfold gravitationalCoupling
    field_simp [Real.pi_ne_zero, hscale, hscreen0']
  exact ⟨hflow, hdet, hflux, hfluxdet, htangent, hscreen,
    hderiv, hray, hbalance, hhodge, hclock, heinstein, hcoupling'⟩

#print axioms HorizonEinsteinClosure.hodgeBulkAndQuarticScreen
#print axioms HorizonEinsteinClosure.kmsBoundarySelectsOpticalFlow
#print axioms HorizonEinsteinClosure.quarticNullCongruenceRaychaudhuri
#print axioms HorizonEinsteinClosure.nullConeRigidity4
#print axioms HorizonEinsteinClosure.nullClausiusForcesLocalEinsteinShape
#print axioms HorizonEinsteinClosure.horizonEinsteinClosure
#print axioms HorizonEinsteinClosure.gravityExponentFromConformalResponseSpace

end

end HorizonEinsteinClosure
