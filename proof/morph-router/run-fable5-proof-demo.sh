#!/bin/bash
# Demo driver for the PR #1443 proof recording.
# Shows the branch/build context, then runs the Claude Code acceptance
# smoke test against the branch-built CCR with mock Morph/provider endpoints.
set -euo pipefail
cd "$(dirname "$0")/.."

run() {
  printf '\n\033[1;36m$ %s\033[0m\n' "$*"
  sleep 0.8
  "$@"
  sleep 0.8
}

echo "== claude-code-router PR #1443: Morph Model Router custom router =="
echo "== Proof: real Claude Code CLI -> branch-built CCR -> Morph route -> provider =="
run git rev-parse --abbrev-ref HEAD
run git log -1 --oneline
run node --version
run claude --version
run ls -l dist/cli.js
run node examples/morph-router-claude-code-smoke-test.cjs

printf '\n\033[1;32m== Done: Morph router picked openai/chosen-model and CCR delivered it ==\033[0m\n'
sleep 4
