import GravityScreening.LocalEinsteinClosure

/-!
# Integrated horizon-to-Einstein capstone

This file joins the three principal parts of the construction in one theorem:
quartic KMS boundary selection, exact optical/Raychaudhuri propagation, and
the pointwise null-cone closure to the Einstein tensor with the complete
rho-Q determinant.  The physical placement of the quartic KMS line and the
local null Clausius relation remain explicit hypotheses.
-/

namespace GravityScreening

/-- Integrated PDT horizon-to-Einstein closure.  Exchange symmetry, unit
normalization, and an unoriented quartic KMS line force the complete affine
screen flow and its quadratic shear/area response.  The same selected flow is
an explicit null congruence obeying the vacuum Raychaudhuri equation and the
horizon modular-energy balance.  If the local null Clausius contraction holds,
null-cone rigidity produces the Einstein-tensor equation with the full rho-Q
coupling determinant. -/
theorem horizonEinsteinClosure_capstone
    (M : Matrix (Fin 2) (Fin 2) ℝ)
    (ricci stress : Matrix (Fin 4) (Fin 4) ℝ)
    (rho q u charge K inverseG area : ℝ)
    (screenLabel : Fin 2 → ℝ)
    (hrho3 : rho ^ 3 = rho + 1) (hrho1 : 1 < rho)
    (hq4 : q ^ 4 = q + 1) (hq1 : 1 < q)
    (hu0 : 0 ≤ u) (hu1 : u ≤ 1)
    (hG : inverseG ≠ 0)
    (hexchange : IsChannelExchangeSymmetric M)
    (hmean : HasUnitDiagonalMean M)
    (hcore : HasUnorientedCoreWeight M q)
    (hconstraint :
      horizonConstraintResidual charge K inverseG area = 0)
    (hricci : ricci.transpose = ricci)
    (hstress : stress.transpose = stress)
    (hnull : ∀ v : Fin 4 → ℝ,
      localMinkowskiSq v = 0 →
        localQuadraticContraction
          (ricci - (8 * Real.pi * gravitationalCoupling rho q) • stress)
          v = 0) :
    (∀ t,
      affineScreenFlow M t = perronOpticalJacobi (lambda4 q) t ∨
        affineScreenFlow M t = perronOpticalJacobi (-lambda4 q) t) ∧
      Matrix.det M = screening (lambda4 q) ∧
      lambda4 q = quarticBiResidualCoefficient q ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = lambda4 q ^ 2 ∧
      unitBoostWeightedInitialShearFlux (lambda4 q) = 1 - Matrix.det M ∧
      doubleNullMinkowskiSq
          (perronNullTangent (lambda4 q) screenLabel) = 0 ∧
      (perronNullGeodesic (lambda4 q) screenLabel u 2 =
          (perronOpticalJacobi (lambda4 q) u).mulVec screenLabel 0 ∧
        perronNullGeodesic (lambda4 q) screenLabel u 3 =
          (perronOpticalJacobi (lambda4 q) u).mulVec screenLabel 1) ∧
      HasDerivAt (perronOpticalExpansion (lambda4 q))
        (perronOpticalExpansionRate (lambda4 q) u) u ∧
      perronOpticalExpansionRate (lambda4 q) u =
        -(perronOpticalExpansion (lambda4 q) u) ^ 2 / 2 -
          perronOpticalShearSq (lambda4 q) u ∧
      horizonConstraintResidual charge
          (K + perronOpticalModularEnergyIncrement
            inverseG area (lambda4 q))
          inverseG (Matrix.det M * area) = 0 ∧
      Irrational (Real.log rho / Real.log q) ∧
      (∃ cosmological : ℝ,
        ricci - (localMinkowskiTrace ricci / 2) • localMinkowskiMetric +
            cosmological • localMinkowskiMetric =
          (8 * Real.pi * gravitationalCoupling rho q) • stress) ∧
      1 / gravitationalCoupling rho q =
        (Matrix.det
            (scalarResponseMatrix gravitationalExponent (rho * q)) *
          Matrix.det (perronCompressedConstitutiveBlock q)) /
          Real.pi ^ 4 := by
  rcases quarticKMSOpticalBoundarySelection_capstone
      M q charge K inverseG area hq4 hq1 hG hexchange hmean hcore
      hconstraint with
    ⟨hflow, hdet, hresidual, _hdetpos, hflux, hfluxdet,
      _hzeroExpansion, hbalance⟩
  have hray := quarticPerronOptical_Raychaudhuri_on_unitInterval
    q u hq1 hu0 hu1
  rcases pdtNullClausius_forces_localEinsteinShape
      ricci stress rho q hrho3 hrho1 hq4 hq1 hricci hstress hnull with
    ⟨hclock, heinstein, hcoupling⟩
  exact ⟨hflow, hdet, hresidual, hflux, hfluxdet,
    perronNullTangent_isNull (lambda4 q) screenLabel,
    perronNullGeodesic_screen_eq_Jacobi (lambda4 q) screenLabel u,
    hray.1, hray.2, hbalance, hclock, heinstein, hcoupling⟩

#print axioms GravityScreening.horizonEinsteinClosure_capstone

end GravityScreening
