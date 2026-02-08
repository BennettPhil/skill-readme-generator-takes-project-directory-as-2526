#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PASS=0
FAIL=0
TOTAL=0

pass() { PASS=$((PASS + 1)); TOTAL=$((TOTAL + 1)); echo "  PASS: $1"; }
fail() { FAIL=$((FAIL + 1)); TOTAL=$((TOTAL + 1)); echo "  FAIL: $1 -- $2"; }

assert_eq() {
  local description="$1" expected="$2" actual="$3"
  if [ "$expected" = "$actual" ]; then
    pass "$description"
  else
    fail "$description" "expected '$expected', got '$actual'"
  fi
}

assert_exit_code() {
  local description="$1" expected_code="$2"
  shift 2
  set +e
  "$@" >/dev/null 2>&1
  local actual_code=$?
  set -e
  if [ "$expected_code" -eq "$actual_code" ]; then
    pass "$description"
  else
    fail "$description" "expected exit code $expected_code, got $actual_code"
  fi
}

assert_contains() {
  local description="$1" needle="$2" haystack="$3"
  if echo "$haystack" | grep -q "$needle"; then
    pass "$description"
  else
    fail "$description" "output missing '$needle'"
  fi
}

echo "Running tests"
echo "============="

output="$("$SCRIPT_DIR/run.sh" sample-target)"
assert_contains "run includes Goal" "Goal:" "$output"
assert_contains "run includes Steps" "Steps:" "$output"
assert_exit_code "fails with no args" 1 "$SCRIPT_DIR/run.sh"
assert_eq "help exits zero" "0" "$("$SCRIPT_DIR/run.sh" --help >/dev/null 2>&1; echo $?)"

echo "============="
echo "Results: $PASS passed, $FAIL failed, $TOTAL total"
[ "$FAIL" -eq 0 ] || exit 1
