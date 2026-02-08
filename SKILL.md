---
name: readme-generator-takes-project-directory-as-2526
description: A README generator that takes a project directory as input and produces a well-structured README.md by anal...
version: 0.1.0
license: Apache-2.0
---

# readme-generator-takes-project-directory-as-2526

## Purpose

Test-driven skill scaffold for: A README generator that takes a project directory as input and produces a well-structured README.md by analyzing the codebase. It should detect the language, build system, and p....

## Contract

- Prints a clear `Goal` and ordered `Steps`.
- Fails with exit code `1` when required arguments are missing.
- Supports `--help` with exit code `0`.

## Inputs

- `target`: required positional argument.

## Outputs

- Human-readable plan on stdout.

## Error Handling

- Missing target returns non-zero and prints an error message.

## Testing

Run `./scripts/test.sh`. The tests are the source of truth for expected behavior.
