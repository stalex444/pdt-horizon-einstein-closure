# Palomar rendering compatibility

This presentation addresses [PalomarSubmission issue #134](https://github.com/PalomarRegistry/PalomarSubmission/issues/134).
The preceding submitted snapshot is `78e4b92b0cb28efc8ba13afce77fee8b8a6e15b2`.
Its [official mechanical verification passed](https://github.com/PalomarRegistry/PalomarSubmission/actions/runs/34402569586),
but its [rendering failed](https://github.com/PalomarRegistry/PalomarSubmission/actions/runs/34405203359).

## Presentation change

For each of the seven existing theorem names, `Challenge.lean` and
`Solution.lean` define a proposition named `<theoremName>Statement`. Its body
contains the theorem's complete original quantifiers, hypotheses, and
conclusion. The theorem then proves that proposition. The Solution proof
introduces the same variables and hypotheses and uses the original proof body.

These proposition definitions are ordinary, fixed dependencies. They have no
placeholders and are deliberately absent from `definition_names`, which stays
empty. The pinned Comparator follows their bodies through its ordinary
declaration-closure comparison. Adding them to `definition_names` would instead
make them replaceable holes and is not part of this workaround.

Palomar's core-notation audit can print the theorem's type without trying to
reconstruct the internal Mathlib type hierarchy that triggers issue #134.
The full proposition also appears verbatim in the theorem's documentation,
because Palomar's partial declaration view omits ordinary dependency
definitions. `scripts/check_render_statements.py` verifies that these displayed
copies are identical to the compiled definitions in both Lean files.

All 80 supporting Lean modules are unchanged. The exponent remains defined
as the dimension of the trace-free response space and derived as 224. The
conditional physical assumptions and all seven conclusions are preserved.

## Verification

The local validation package contains:

- A successful Lean 4.31.0 project build and standard-axiom reports.
- Seven kernel-checked `HEq` certificates between the original and redrafted
  theorem proofs, using an independently namespaced copy of the original
  Solution. These establish that the old and new proof types are definitionally
  equal, allowing Lean's standard proof irrelevance.
- The exact unmodified `core_notation_audit.lean` from Palomar renderer revision
  `ef2fa1eadcb246c2346ddba39b52eaa53d4bb763`, applied to all seven selected
  declarations.
- A local rendering build with the pinned Verso revision
  `b677415e8a0becccc0b850137c2d8f6205132a91`, and checks of the complete statements
  in the selected reviewer view.
- Comparator declaration-closure and axiom checks using its pinned revision
  `575674928e239f5bc452aab72d1dd7b0f1326494`, including negative controls that
  replace each proposition body with `True` and must be rejected.

This is a local compatibility validation. A changed commit still requires
Palomar's own mechanical verification, Linux sandbox, NanoDa check, rendering,
and editorial review. The earlier official pass applies to the earlier commit.
Local success does not establish registration, acceptance, or empirical
validation of the proposed physics.

Routine checks from the repository root:

```sh
lake build
python3 scripts/check_render_statements.py
```
