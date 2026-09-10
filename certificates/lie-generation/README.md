# Independent exact Lie-word reconstruction

Run `python3 certificates/lie-generation/exact_certificate.py` from the
repository root. Only Python's standard library is required.

The verifier rebuilds the fifteen adjoint generators and local Hodge operator
from the six-dimensional metric and bivector formulas. It evaluates224
integer Lie words and reconstructs every off-diagonal matrix unit and the14
diagonal differences using exact rational coefficients. It verifies all
reconstructed entries, not a floating-point rank or rank at one prime.
The largest reconstruction has ten terms, denominators are one or two,
and the absolute change-of-basis determinant is2^119.

`closure_certificate.json` records discovery data and Lie-word recipes.
`exact_matrix_unit_certificate.json` is rebuilt by the verifier. Modular
arithmetic used during discovery is not a premise of the exact check.

The Lean theorem follows the smaller structural certificate in
`ResponseClosureCertificate.lean` and the general argument in
`GravityScreening/SignedLieGeneration.lean`; it does not invoke this Python
program as a proof oracle. The two constructions provide independently
checkable evidence for the same concrete generation result.
