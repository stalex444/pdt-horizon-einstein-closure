#!/usr/bin/env python3
"""Evaluate the stated PDT expression; measured G is used only for comparison.

Requires mpmath. Constants: NIST CODATA 2022 complete ASCII table,
https://physics.nist.gov/cuu/Constants/Table/allascii.txt (read 2026-09-10).
This numerical calculation does not prove the physical identification.
"""
import json

import mpmath as mp


def prediction(electron_mass, planck_constant, light_speed):
    rho = mp.findroot(lambda x: x**3 - x - 1, (mp.mpf("1.3"), mp.mpf("1.4")))
    q = mp.findroot(lambda x: x**4 - x - 1, (mp.mpf("1.2"), mp.mpf("1.3")))
    screening = (2 * q - 1) / q**2
    alpha_g = mp.pi**4 / (screening * (rho * q)**224)
    g = alpha_g * (planck_constant / (2 * mp.pi)) * light_speed / electron_mass**2
    return rho, q, screening, alpha_g, g


def main():
    mp.mp.dps = 80
    mass = mp.mpf("9.1093837139e-31")
    mass_uncertainty = mp.mpf("0.0000000028e-31")
    planck_constant = mp.mpf("6.62607015e-34")
    light_speed = mp.mpf("299792458")
    rho, q, screening, alpha_g, g = prediction(mass, planck_constant, light_speed)

    # The reference is not an argument to prediction and is never fitted.
    reference_g = mp.mpf("6.67430e-11")
    reference_uncertainty = mp.mpf("0.00015e-11")
    number = lambda x: mp.nstr(x, 35)
    result = {
        "formula": "G = pi^4*hbar*c / [S_Q*(rho*Q)^224*m_e^2]",
        "units_G": "m^3 kg^-1 s^-2",
        "source": "https://physics.nist.gov/cuu/Constants/Table/allascii.txt",
        "constant_adjustment": "CODATA 2022",
        "retrieved": "2026-09-10",
        "arithmetic_decimal_precision": mp.mp.dps,
        "prediction_inputs": {
            "electron_mass_kg": number(mass),
            "electron_mass_standard_uncertainty_kg": number(mass_uncertainty),
            "planck_constant_J_s_exact": number(planck_constant),
            "light_speed_m_per_s_exact": number(light_speed),
            "exponent": 224,
            "exponent_origin": "dimension of the specified generated trace-free response algebra",
        },
        "rho": number(rho),
        "Q": number(q),
        "root_equation_residuals": [number(rho**3-rho-1), number(q**4-q-1)],
        "screening": number(screening),
        "screening_identity_residual": number(screening - (1-(1-1/q)**2)),
        "alpha_G": number(alpha_g),
        "G_prediction": number(g),
        "comparison_only": {
            "G_reference": number(reference_g),
            "G_reference_standard_uncertainty": number(reference_uncertainty),
            "signed_difference": number(g-reference_g),
            "signed_relative_percent": number(100*(g/reference_g-1)),
            "signed_reference_standard_uncertainty_units": number((g-reference_g)/reference_uncertainty),
        },
        "electron_mass_only_propagated_uncertainty": number(2*g*mass_uncertainty/mass),
        "interpretation": "Conditional formula evaluation; no model-error distribution or global significance is assigned. The displayed numerical precision exceeds physical input precision. The electron-mass uncertainty is not the total uncertainty of the physical theory.",
    }
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
