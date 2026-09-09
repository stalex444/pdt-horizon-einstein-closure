# Proof map

The map distinguishes kernel mathematics from the physical and finite-model
inputs in the integrated theorem.

| Stage | Input | Kernel result | Principal Lean declaration | Status |
|---|---|---|---|---|
| Algebraic scales | `rho^3=rho+1`, `Q^4=Q+1`, both roots above one | The modular log ratio is irrational; the joint scale is `rho Q` | `rhoQ_modularCompletion_capstone` | proved |
| Structural exponent | The real conformal generator space `so(4,2)` and evaluation of its trace-free endomorphisms at a nonzero generator | `dim so(4,2)=15`, the action is surjective, the stabilizer has dimension 209, and `dim sl(15)=224=15+209` | `gravityExponentFromConformalResponseSpace` | proved; using this dimension as the gravity exponent is the PDT physical identification |
| Hodge divide | Conditional assignment of `rho` and `Q` to opposite chiral projectors | Multiplication by the orientation-flipped divide gives exactly `(rho Q)I` | `hodgeDivide_mul_flip` | proved as operator algebra; the curvature interpretation is a physical placement |
| Hodge screen | Normalized quartic response `I+lambda4 C` on the same Hodge pair | Multiplication by its flip gives `((2Q-1)/Q^2)I` | `hodgeBulkAndQuarticScreen` | proved as a separate operator identity; it is not equated with the divide operator |
| Coupling determinant | 224-dimensional scalar response and the quartic two-channel block | `1/alphaG_PDT = det((rho Q)I_224) det(K_Q)/pi^4` | `canonicalPerron_fullGravity_determinant` | proved as an exact consequence of the displayed dimensionless coupling definition |
| Quartic carrier | Quartic companion residual and left/right Perron modes | Perron compression gives `lambda4=1-1/Q`; the symmetric block has determinant `1-lambda4^2` | `quarticPerron_carrier_classification` | proved |
| KMS boundary | Exchange symmetry, unit diagonal mean, `1/Q` on either exchange line | The endpoint and full affine flow are unique up to shear orientation | `quarticKMSOpticalBoundarySelection_capstone` | proved, conditional on the stated boundary placement |
| Null realization | The positive-orientation affine branch | An explicit affine null-ray family has transverse map `J_Q(t)` | `perronNullTangent_isNull`; `perronNullGeodesic_screen_eq_Jacobi` | proved; the classified opposite orientation has the same scalar determinant and shear-square data |
| Optical focusing | `J_Q(t)=I+tV_Q` on the unit interval | The defined expansion and shear satisfy the scalar identity having the twist-free vacuum Raychaudhuri form; initial expansion is zero | `quarticPerronOptical_Raychaudhuri_on_unitInterval` | proved |
| Defined horizon-shear response | Linear boost weight and squared initial shear | Normalized shear flux equals `lambda4^2`, the missing area fraction | `quarticBoostShearFlux_eq_areaDeficit` | proved; its physical use is motivated by the cited quadratic graviton-shear term |
| Horizon balance | Initially vanishing normalized scalar horizon residual using `1/alphaG_PDT` | The defined modular-energy increment with the same `1/alphaG_PDT` exactly preserves the residual after the area update | `horizonConstraint_perronOptical_update` | proved, conditional on the initial residual |
| Local thermodynamic input | Null Clausius contraction for every local null vector | `Ricci - kappa T` is proportional to the local metric | `nullClausius_forces_localEinsteinShape` | proved, conditional on the Clausius premise |
| Einstein closure | Dimensionless null Clausius premise in electron-mass natural units with the repository-defined `kappa=8 pi alphaG_PDT` | Local Einstein-tensor equation with one cosmological scalar | `pdtNullClausius_forces_localEinsteinShape` | proved, conditional on the displayed premise and normalization |
| Integrated result | Selected outputs from the rows above | One theorem carries the exact determinant identity for the defined `rho Q` coupling, optical model, conditional horizon balance, and Einstein equation shape | `HorizonEinsteinClosure.horizonEinsteinClosure` | proved |

## Dependency logic

| Physical or model input | Consequence proved in Lean | What would falsify the proposed placement |
|---|---|---|
| The horizon screen carries the quartic `1/Q` KMS/core line and satisfies the displayed exchange/normalization conditions | The response matrix, shear magnitude, and affine flow are classified up to orientation | A derived horizon response with a different eigenweight or additional mode mixing under the same conditions |
| `rho` and `Q` weight opposite chiralities in the proposed bulk Hodge divide | Pairing the two orientations gives the joint bulk scalar `rho Q` | A physical curvature decomposition that does not realize this weighting or orientation pairing |
| Affine interpolation from the identity is the finite screen model | The classified endpoint determines every intermediate screen map | A physical propagation law that is non-affine or contains additional degrees of freedom |
| The initial scalar horizon residual vanishes | The defined modular-energy increment preserves that residual after the area update | Failure of the scalar balance law in the proposed horizon setting |
| The dimensionless local null Clausius contraction uses the defined `8 pi alphaG_PDT` in electron-mass natural units | Null-cone rigidity forces the local Einstein-tensor equation | Failure of the contraction for a local null generator or measured `alpha_G = G_N m_e^2/(hbar c)` inconsistent with the formula |

The matrix classification, null-ray realization, Raychaudhuri-form identity,
shear square, conditional area balance, and tensor closure are kernel-checked
implications of the inputs shown in this map.
