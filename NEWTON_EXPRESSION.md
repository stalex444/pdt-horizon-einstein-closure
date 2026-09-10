# Reproducible evaluation of the PDT Newton expression

The existing PDT formula gives

```text
G = pi^4 hbar c / [S_Q (rho Q)^224 m_e^2],
rho^3=rho+1, Q^4=Q+1, rho>1, Q>1,
S_Q=(2Q-1)/Q^2.
```

The calculation uses the electron mass as its dimensional anchor. Measured
G is used only after evaluating the expression, as a comparison target.
The exponent is the dimension of the specified generated response algebra;
there is no numerical exponent search in the reproducer. The physical
coupling identification is part of the PDT model, as discussed in
[PHYSICAL_SCOPE.md](PHYSICAL_SCOPE.md).

Using the CODATA 2022 electron mass `9.1093837139e-31 kg`, exact
`h=6.62607015e-34 J s` and `c=299792458 m/s`, with `hbar=h/(2pi)`, gives
the following. The reference value and its quoted standard uncertainty
are from the [NIST complete constants table](https://physics.nist.gov/cuu/Constants/Table/allascii.txt),
retrieved 10 September 2026.

| Quantity | Value |
|---|---:|
| `S_Q` | `0.96730142008853967` |
| `alpha_G` from the formula | `1.7517576915726823e-45` |
| G from the formula | `6.6741029983e-11 m^3 kg^-1 s^-2` |
| NIST reference G | `6.67430e-11 m^3 kg^-1 s^-2` |
| NIST standard uncertainty | `0.00015e-11 m^3 kg^-1 s^-2` |
| Signed relative difference | `-0.00295165%` |
| Difference / quoted reference uncertainty | `-1.31334` |

Thus the expression lies approximately 1.31 quoted reference standard
uncertainties below the recommended value. This is a close numerical
comparison, not exact equality. It does not by itself validate the physical
mechanism or assign a significance level to the theory. The extra digits
shown describe the formula evaluation, not equivalent physical precision.

The electron-mass input alone propagates a standard uncertainty of about
`4.10e-20 m^3 kg^-1 s^-2`; this is not a total theory uncertainty. No
model-error distribution is assumed. The older companion script labels its
inputs CODATA 2022 but uses an older electron-mass central value and a
truncated hbar. The present reproducer uses the stated 2022 mass and computes
hbar from exact h; the small input correction does not change the conclusion.

Run with Python and mpmath:

```sh
python3 scripts/check_newton_expression.py
```

The output records the inputs, root residuals, screening identity, expression
value and signed comparison separately. This script evaluates the existing
formula; the selected Lean theorems establish their stated algebraic and
optical conclusions rather than this empirical identification.
