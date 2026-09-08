# Proof map

The map distinguishes kernel mathematics from the two physical premises in
the integrated theorem.

| Stage | Input | Kernel result | Principal Lean declaration | Status |
|---|---|---|---|---|
| Algebraic scales | `rho^3=rho+1`, `Q^4=Q+1`, both roots above one | The modular log ratio is irrational; the joint scale is `rho Q` | `rhoQ_modularCompletion_capstone` | proved |
| Coupling determinant | 224-dimensional scalar response and the quartic two-channel block | `1/G_PDT = det((rho Q)I_224) det(K_Q)/pi^4` | `canonicalPerron_fullGravity_determinant` | proved as an exact consequence of the displayed coupling definition |
| Quartic carrier | Quartic companion residual and left/right Perron modes | Perron compression gives `lambda4=1-1/Q`; the symmetric block has determinant `1-lambda4^2` | `quarticPerron_carrier_classification` | proved |
| KMS boundary | Exchange symmetry, unit diagonal mean, `1/Q` on either exchange line | The endpoint and full affine flow are unique up to shear orientation | `quarticKMSOpticalBoundarySelection_capstone` | proved, conditional on the stated boundary placement |
| Null realization | The selected affine flow | Explicit rays have null tangent and transverse Jacobi map `J_Q(t)` | `perronNullTangent_isNull`; `perronNullGeodesic_screen_eq_Jacobi` | proved |
| Optical focusing | `J_Q(t)=I+tV_Q` on the unit interval | Exact twist-free vacuum Raychaudhuri equation; zero initial expansion | `quarticPerronOptical_Raychaudhuri_on_unitInterval` | proved |
| Graviton/horizon response | Linear boost weight and squared initial shear | Normalized shear flux equals `lambda4^2`, the missing area fraction | `quarticBoostShearFlux_eq_areaDeficit` | proved |
| Horizon balance | Initial horizon constraint | The derived modular-energy increment exactly balances the area loss | `horizonConstraint_perronOptical_update` | proved |
| Local thermodynamic input | Null Clausius contraction for every local null vector | `Ricci - kappa T` is proportional to the local metric | `nullClausius_forces_localEinsteinShape` | proved, conditional on the Clausius premise |
| Einstein closure | `kappa=8 pi G_PDT` | Local Einstein-tensor equation with one cosmological scalar | `pdtNullClausius_forces_localEinsteinShape` | proved, conditional on both physical inputs |
| Integrated result | All rows above | One theorem carries the complete `rho-Q` determinant, optical mechanism, horizon balance, and Einstein equation | `HorizonEinsteinClosure.horizonEinsteinClosure` | proved |

## Dependency logic

| Physical premise | Consequence proved in Lean | What would falsify the proposed placement |
|---|---|---|
| The horizon screen carries the quartic `1/Q` KMS/core line | The response matrix, shear magnitude, complete affine flow, area deficit, and modular-energy update are fixed | A derived horizon response with a different eigenweight, non-affine propagation under the same hypotheses, or additional mode mixing |
| The local null Clausius contraction uses `8 pi G_PDT` | Null-cone rigidity forces the local Einstein-tensor equation | Failure of the Clausius contraction for a local null generator or an independently measured coupling inconsistent with the fixed formula |

No extra physical premise is inserted between these two rows.  The intervening
matrix classification, null congruence, Raychaudhuri law, shear square, area
balance, and tensor closure are kernel-checked implications.
