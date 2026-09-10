# Complete statements in the reviewer view

The comparison uses the presentation developed for
[PalomarSubmission issue134](https://github.com/PalomarRegistry/PalomarSubmission/issues/134).
For every selected result, Challenge and Solution define an ordinary
`<theoremName>Statement : Prop` containing the complete quantified claim.
The theorem proves that proposition. These are fixed definitions, never
Comparator definition holes: `definition_names` remains empty.

Palomar's partial declaration view shows a theorem and its immediately
preceding documentation. Each documentation block therefore repeats the
complete proposition definition verbatim. The script
`scripts/check_render_statements.py` checks agreement between the displayed
copy, compiled definition and corresponding Challenge/Solution definition.
The geometric/operator definitions are ordinary checked dependencies.

This revision changes the mathematics and selected result set. It does not
claim equivalence to the previous seven theorem types. Earlier verification
receipts apply only to their original commits. The new source requires fresh
Lean, declaration-closure, axiom and renderer checks, followed by Palomar's
own mechanical and editorial review.

```sh
lake build
python3 scripts/check_render_statements.py
```
