import Mathlib
import GravityScreening.HodgeLieGeneration
import ResponseClosureGeometry
import GravityScreening.PdtOpticalRepair
import GravityScreening.TwoSidedTraceFree

/-!
# Geometric Hodge Lie generation and conditional companion results

The principal theorem starts from fifteen actual adjoint matrices of the
six-dimensional orthogonal algebra and one oriented Lorentz Hodge extension.
The matrices are calculated from the displayed metric, bivector basis, matrix
commutators, and orientation formula. Their Lie closure is the full trace-free
response algebra over every field in which two is nonzero.

The optical statements separately prove an orthogonal affine null realization
and a finite-cut integral identity under explicitly stated optical equations.
The last statement gives the exact preservation condition for a two-sided
response on trace-free matrices. No gravitational coupling, constitutive law,
entropy identification, or Einstein equation is inferred here.

For rendering compatibility, each selected theorem proves an ordinary named
proposition. Its complete definition is copied verbatim into the immediately
preceding documentation comment. Comparator follows the proposition body as
an ordinary dependency; definition_names remains empty.
-/

namespace HorizonEinsteinClosure

noncomputable section

open scoped Matrix Interval
open MeasureTheory
attribute [local instance] LieRing.ofAssociativeRing

abbrev AmbientIntegralMatrix := Matrix (Fin 6) (Fin 6) ℤ
abbrev IntegralResponse := Matrix (Fin 15) (Fin 15) ℤ

/-- Ambient metric with real signature (4,2), whose first four directions
have Lorentz signature (3,1). -/
def eta : Fin 6 → ℤ := ![1, 1, 1, -1, 1, -1]

/-- All increasing bivector index pairs, in lexicographic order. -/
def bivectorPairs : Fin 15 → Fin 6 × Fin 6 :=
  ![(0,1), (0,2), (0,3), (0,4), (0,5), (1,2), (1,3), (1,4),
    (1,5), (2,3), (2,4), (2,5), (3,4), (3,5), (4,5)]

/-- The actual orthogonal matrix L_ab = eta_b E_ab - eta_a E_ba. -/
def orthogonalGenerator (p : Fin 15) : AmbientIntegralMatrix :=
  Matrix.single (bivectorPairs p).1 (bivectorPairs p).2 (eta (bivectorPairs p).2) -
  Matrix.single (bivectorPairs p).2 (bivectorPairs p).1 (eta (bivectorPairs p).1)

/-- Bivector coefficient of a six-dimensional orthogonal matrix. -/
def bivectorCoordinates (M : AmbientIntegralMatrix) (p : Fin 15) : ℤ :=
  eta (bivectorPairs p).2 * M (bivectorPairs p).1 (bivectorPairs p).2

/-- The adjoint matrix is computed from actual six-by-six commutators. -/
def integralAdjoint (p : Fin 15) : IntegralResponse := fun output input =>
  bivectorCoordinates
    (orthogonalGenerator p * orthogonalGenerator input -
      orthogonalGenerator input * orthogonalGenerator p) output

/-- Inversion count for the four-dimensional orientation sign. -/
def inversions4 (a b c d : Fin 6) : ℕ :=
  (if a > b then 1 else 0) + (if a > c then 1 else 0) +
  (if a > d then 1 else 0) + (if b > c then 1 else 0) +
  (if b > d then 1 else 0) + (if c > d then 1 else 0)

/-- Oriented volume of the coordinate four-plane 0123, zero outside it or
when indices repeat. -/
def epsilon4 (a b c d : Fin 6) : ℤ :=
  if a.val < 4 ∧ b.val < 4 ∧ c.val < 4 ∧ d.val < 4 ∧
      a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d
  then (-1) ^ inversions4 a b c d else 0

/-- Lorentz Hodge star on local bivectors, extended by zero on the other
nine conformal directions. -/
def integralHodge : IntegralResponse := fun output input =>
  eta (bivectorPairs input).1 * eta (bivectorPairs input).2 *
    epsilon4 (bivectorPairs input).1 (bivectorPairs input).2
      (bivectorPairs output).1 (bivectorPairs output).2

abbrev ResponseMatrix (K : Type) := Matrix (Fin 15) (Fin 15) K

/-- Explicit scalar extension of the geometrically computed adjoint matrix. -/
def geometricAdjoint (K : Type) [Field K] (p : Fin 15) : ResponseMatrix K :=
  fun i j => (integralAdjoint p i j : K)

/-- Explicit scalar extension of the local Lorentz Hodge operator. -/
def geometricHodge (K : Type) [Field K] : ResponseMatrix K :=
  fun i j => (integralHodge i j : K)

/-- The least Lie subalgebra containing the adjoint actions and Hodge star. -/
def geometricResponseAlgebra (K : Type) [Field K] :
    LieSubalgebra K (ResponseMatrix K) :=
  LieSubalgebra.lieSpan K (ResponseMatrix K)
    (Set.range (geometricAdjoint K) ∪ {geometricHodge K})

abbrev Screen := Fin 2 → ℝ
abbrev Spacetime := Fin 4 → ℝ

def minkowskiPair (x y : Spacetime) : ℝ :=
  -x 0 * y 1 - x 1 * y 0 + x 2 * y 2 + x 3 * y 3

def jacobi (S : Matrix (Fin 2) (Fin 2) ℝ) (u : ℝ) :=
  (1 : Matrix (Fin 2) (Fin 2) ℝ) + u • S

def nullRay (S : Matrix (Fin 2) (Fin 2) ℝ) (y : Screen) (u : ℝ) :
    Spacetime :=
  let v := S.mulVec y
  ![u, (dotProduct y v + u * dotProduct v v) / 2,
    y 0 + u * v 0, y 1 + u * v 1]

def tangent (S : Matrix (Fin 2) (Fin 2) ℝ) (y : Screen) : Spacetime :=
  let v := S.mulVec y
  ![1, dotProduct v v / 2, v 0, v 1]

def variation (S : Matrix (Fin 2) (Fin 2) ℝ)
    (y : Screen) (u : ℝ) (e : Screen) : Spacetime :=
  let v := S.mulVec y
  let w := S.mulVec e
  ![0, dotProduct e v + u * dotProduct v w,
    e 0 + u * w 0, e 1 + u * w 1]

private theorem geometricAdjoint_eq_cast (K : Type) [Field K] (p : Fin 15) :
    geometricAdjoint K p = GravityScreening.HodgeLieGeneration.castMatrix K
      (GravityScreening.ResponseClosureCertificate.adj p) := by
  rw [GravityScreening.ResponseClosureGeometry.certificate_adjoint]
  rfl

private theorem geometricHodge_eq_cast (K : Type) [Field K] :
    geometricHodge K = GravityScreening.HodgeLieGeneration.castMatrix K
      GravityScreening.ResponseClosureCertificate.hodge := by
  rw [GravityScreening.ResponseClosureGeometry.certificate_hodge]
  rfl

private theorem geometricResponseAlgebra_eq_generated (K : Type) [Field K] :
    geometricResponseAlgebra K = GravityScreening.HodgeLieGeneration.generated K := by
  have ha : geometricAdjoint K = fun p =>
      GravityScreening.HodgeLieGeneration.castMatrix K
        (GravityScreening.ResponseClosureCertificate.adj p) :=
    funext (geometricAdjoint_eq_cast K)
  change LieSubalgebra.lieSpan K (ResponseMatrix K)
      (Set.range (geometricAdjoint K) ∪ {geometricHodge K}) =
    LieSubalgebra.lieSpan K (ResponseMatrix K)
      (Set.range (fun p => GravityScreening.HodgeLieGeneration.castMatrix K
        (GravityScreening.ResponseClosureCertificate.adj p)) ∪
        {GravityScreening.HodgeLieGeneration.castMatrix K
          GravityScreening.ResponseClosureCertificate.hodge})
  rw [ha, geometricHodge_eq_cast]

def geometricHodgeGenerationStatement : Prop :=
  ∀ (K : Type) [Field K], (2 : K) ≠ 0 →
    geometricResponseAlgebra K = LieAlgebra.SpecialLinear.sl (Fin 15) K ∧
      Module.finrank K (geometricResponseAlgebra K) = 224

/-- Complete statement proved below. The complete geometric data are as follows. The ambient metric is
eta = diag(1,1,1,-1,1,-1). The ordered bivector basis is
01,02,03,04,05,12,13,14,15,23,24,25,34,35,45, with
L_ab = eta_b E_ab - eta_a E_ba as actual six-by-six matrices.
The adjoint generator indexed by p sends L_c to [L_p,L_c]; its coefficient
along L_ab is eta_b times the (a,b) entry of that actual matrix commutator.

The oriented Lorentz four-plane is 0123. Its local Hodge operator satisfies
H(L01)=L23, H(L23)=-L01; H(L02)=-L13, H(L13)=L02;
H(L03)=-L12, H(L12)=L03. It is zero on the other nine basis vectors.
The displayed integer coefficients are extended entrywise to K.
Here geometricResponseAlgebra K is the smallest K-linear matrix subspace
containing these fifteen adjoint actions and H and closed under AB-BA.
The conclusion identifies that generated algebra with all trace-free
fifteen-by-fifteen matrices; its dimension is a consequence of generation.

The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def geometricHodgeGenerationStatement : Prop :=
  ∀ (K : Type) [Field K], (2 : K) ≠ 0 →
    geometricResponseAlgebra K = LieAlgebra.SpecialLinear.sl (Fin 15) K ∧
      Module.finrank K (geometricResponseAlgebra K) = 224
```
-/
theorem geometricHodgeGeneration : geometricHodgeGenerationStatement := by
  intro K _ htwo
  rw [geometricResponseAlgebra_eq_generated]
  exact ⟨GravityScreening.HodgeLieGeneration.generated_eq_sl K htwo,
    GravityScreening.HodgeLieGeneration.finrank_generated K htwo⟩

def orthogonalNullFamilyStatement : Prop :=
  ∀ (S : Matrix (Fin 2) (Fin 2) ℝ) (y : Screen) (u : ℝ),
    S.transpose = S → (jacobi S u).det ≠ 0 →
      (∀ i : Fin 4, HasDerivAt (fun t => nullRay S y t i) (tangent S y i) u) ∧
      minkowskiPair (tangent S y) (tangent S y) = 0 ∧
      ∀ e : Screen,
        (∀ i : Fin 4, HasDerivAt (fun t : ℝ => nullRay S (y + t • e) u i)
          (variation S y u e i) 0) ∧
        minkowskiPair (tangent S y) (variation S y u e) = 0 ∧
        (∀ f : Screen,
          minkowskiPair (variation S y u e) (variation S y u f) =
            dotProduct ((jacobi S u).mulVec e) ((jacobi S u).mulVec f)) ∧
        (e ≠ 0 → 0 < minkowskiPair (variation S y u e) (variation S y u e))

/-- Complete statement proved below. Write v=S y, w=S e, and J(u)=I+u S, with the ordinary Euclidean
screen dot product. The helpers in the statement have these explicit formulas:
nullRay(u,y) = (u, (y dot v + u (v dot v))/2, y+u v);
tangent(y) = (1, (v dot v)/2, v);
variation(u,y;e) = (0, e dot v + u (v dot w), e+u w).
The last component in each tuple is the two-component transverse screen vector.
The ambient pairing is minkowskiPair(x,z) = -x0 z1 - x1 z0 + x2 z2 + x3 z3,
and jacobi S u = J(u). Symmetry of S makes the displayed variation the actual
label derivative. Nonsingularity of J(u) makes the induced screen pairing
positive. All derivative, nullness, orthogonality, and pairing claims appear
explicitly below.

The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def orthogonalNullFamilyStatement : Prop :=
  ∀ (S : Matrix (Fin 2) (Fin 2) ℝ) (y : Screen) (u : ℝ),
    S.transpose = S → (jacobi S u).det ≠ 0 →
      (∀ i : Fin 4, HasDerivAt (fun t => nullRay S y t i) (tangent S y i) u) ∧
      minkowskiPair (tangent S y) (tangent S y) = 0 ∧
      ∀ e : Screen,
        (∀ i : Fin 4, HasDerivAt (fun t : ℝ => nullRay S (y + t • e) u i)
          (variation S y u e i) 0) ∧
        minkowskiPair (tangent S y) (variation S y u e) = 0 ∧
        (∀ f : Screen,
          minkowskiPair (variation S y u e) (variation S y u f) =
            dotProduct ((jacobi S u).mulVec e) ((jacobi S u).mulVec f)) ∧
        (e ≠ 0 → 0 < minkowskiPair (variation S y u e) (variation S y u e))
```
-/
theorem orthogonalNullFamily : orthogonalNullFamilyStatement := by
  intro S y u hsym hdet
  have hJ : Function.Injective (GravityScreening.OpticalRepair.jacobi S u).mulVec := by
    apply Matrix.mulVec_injective_iff_isUnit.mpr
    apply (Matrix.isUnit_iff_isUnit_det _).mpr
    exact isUnit_iff_ne_zero.mpr hdet
  refine ⟨?_, GravityScreening.OpticalRepair.nullRayTangent_is_null S y, ?_⟩
  · intro i
    exact GravityScreening.OpticalRepair.orthogonalNullRay_entry_hasDerivAt S y u i
  · intro e
    refine ⟨?_, GravityScreening.OpticalRepair.screenVariation_orthogonal_to_tangent
      S y e u, ?_, ?_⟩
    · intro i
      exact GravityScreening.OpticalRepair.orthogonalNullRay_label_hasDerivAt
        S hsym y e u i
    · intro f
      exact GravityScreening.OpticalRepair.screenVariation_pairing S y e f u
    · intro he
      exact GravityScreening.OpticalRepair.screenVariation_pairing_pos S y e u hJ he

def finiteCutOpticalBalanceStatement : Prop :=
  ∀ (A theta shearSq ricci : ℝ → ℝ) (a b : ℝ),
    (∀ u ∈ Set.uIcc a b, HasDerivAt A (theta u * A u) u) →
    (∀ u ∈ Set.uIcc a b, HasDerivAt theta
      (-(theta u) ^ 2 / 2 - shearSq u - ricci u) u) →
    IntervalIntegrable
      (fun u => u * A u * (shearSq u + ricci u - (theta u) ^ 2 / 2))
      volume a b →
    (∫ u in a..b, u * A u * (shearSq u + ricci u - (theta u) ^ 2 / 2)) =
      (A b - b * A b * theta b) - (A a - a * A a * theta a)

/-- Complete statement proved below. This is a conditional identity for arbitrary real functions. The two
assumed differential equations are A'=theta A and
theta'=-theta^2/2-shearSq-ricci. The flux includes the evolving factor A,
the shear and Ricci terms, and the negative expansion-square term.
Both endpoint values of A-u A theta are retained.

The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def finiteCutOpticalBalanceStatement : Prop :=
  ∀ (A theta shearSq ricci : ℝ → ℝ) (a b : ℝ),
    (∀ u ∈ Set.uIcc a b, HasDerivAt A (theta u * A u) u) →
    (∀ u ∈ Set.uIcc a b, HasDerivAt theta
      (-(theta u) ^ 2 / 2 - shearSq u - ricci u) u) →
    IntervalIntegrable
      (fun u => u * A u * (shearSq u + ricci u - (theta u) ^ 2 / 2))
      volume a b →
    (∫ u in a..b, u * A u * (shearSq u + ricci u - (theta u) ^ 2 / 2)) =
      (A b - b * A b * theta b) - (A a - a * A a * theta a)
```
-/
theorem finiteCutOpticalBalance : finiteCutOpticalBalanceStatement := by
  intro A theta shearSq ricci a b hA htheta hint
  exact GravityScreening.OpticalRepair.fullOpticalFlux_eq_boundaryCharge
    A theta shearSq ricci a b hA htheta hint

def twoSidedTraceFreePreservationStatement : Prop :=
  ∀ (ι R : Type) [Fintype ι] [DecidableEq ι] [Nonempty ι] [CommRing R]
    (D E : Matrix ι ι R),
    (∀ T : Matrix ι ι R, T.trace = 0 → (D * T * E).trace = 0) ↔
      ∃ r : R, E * D = r • (1 : Matrix ι ι R)

/-- Complete statement proved below. The response is the explicitly given map T |-> D*T*E. No invertibility
or nonzero scalar is assumed. Over every commutative ring and nonempty finite
index set, preservation of trace zero is equivalent to the reversed product
E*D being scalar, exactly as quantified below.

The displayed definition is an exact copy
of the fixed proposition immediately above; Comparator checks its full body.

```lean
def twoSidedTraceFreePreservationStatement : Prop :=
  ∀ (ι R : Type) [Fintype ι] [DecidableEq ι] [Nonempty ι] [CommRing R]
    (D E : Matrix ι ι R),
    (∀ T : Matrix ι ι R, T.trace = 0 → (D * T * E).trace = 0) ↔
      ∃ r : R, E * D = r • (1 : Matrix ι ι R)
```
-/
theorem twoSidedTraceFreePreservation : twoSidedTraceFreePreservationStatement := by
  intro ι R _ _ _ _ D E
  exact GravityScreening.TwoSidedTraceFree.two_sided_preserves_trace_zero_iff D E

#print axioms HorizonEinsteinClosure.geometricHodgeGeneration
#print axioms HorizonEinsteinClosure.orthogonalNullFamily
#print axioms HorizonEinsteinClosure.finiteCutOpticalBalance
#print axioms HorizonEinsteinClosure.twoSidedTraceFreePreservation

end

end HorizonEinsteinClosure
