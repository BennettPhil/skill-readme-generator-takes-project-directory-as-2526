#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "--help" ]]; then
  echo "Usage: ./scripts/run.sh <target>"
  exit 0
fi

if [[ $# -lt 1 ]]; then
  echo "error: missing target" >&2
  exit 1
fi

target="$1"
echo "Goal: A README generator that takes a project directory as input and produces a well-structured README.md by analyzing the codebase. It should detect the..."
echo "Target: $target"
echo "Steps:"
echo "1. Confirm requirements."
echo "2. Implement core behavior."
echo "3. Validate edge cases."
