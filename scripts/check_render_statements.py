#!/usr/bin/env python3
"""Keep the reviewer-visible statement copies identical to their fixed definitions."""
from pathlib import Path
import json
import re


def check(root: Path) -> None:
    config = json.loads((root / "comparator.json").read_text())
    if config.get("definition_names", []):
        raise ValueError("Statement definitions must remain fixed dependencies, not definition holes")
    statements = {}
    for filename in ("Challenge.lean", "Solution.lean"):
        source = (root / filename).read_text()
        for qualified in config["theorem_names"]:
            name = qualified.rsplit(".", 1)[1]
            statement = name + "Statement"
            # The explicit comment boundary separates actual code from its display copy.
            pattern = (
                r"(?m)^(def " + re.escape(statement) + r" : Prop :=\n.*?)\n\n"
                r"/-- Complete statement.*?```lean\n(.*?)\n```\n-/\n"
                r"theorem " + re.escape(name) + r" :\s+" + re.escape(statement) + r" := by"
            )
            matches = list(re.finditer(pattern, source, re.S))
            if len(matches) != 1:
                raise ValueError(f"Missing or ambiguous complete statement for {qualified} in {filename}")
            definition, displayed = matches[0].groups()
            if definition != displayed:
                raise ValueError(f"Reviewer-visible statement differs from its definition: {qualified}")
            if filename == "Challenge.lean":
                statements[qualified] = definition
            elif statements[qualified] != definition:
                raise ValueError(f"Challenge/Solution statement definitions differ: {qualified}")
    print(f"PASS: {len(statements)} fixed statement definitions agree across Challenge and Solution;")
    print("all reviewer-visible copies are exact, and definition_names is empty.")


if __name__ == "__main__":
    check(Path(__file__).resolve().parents[1])
