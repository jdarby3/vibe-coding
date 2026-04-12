#!/usr/bin/env bash
# Runs after file writes. Checks if a linter config exists and reminds to lint.

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

if [ -f "$REPO_ROOT/.eslintrc" ] || [ -f "$REPO_ROOT/.eslintrc.js" ] || [ -f "$REPO_ROOT/.eslintrc.json" ] || [ -f "$REPO_ROOT/eslint.config.js" ] || [ -f "$REPO_ROOT/eslint.config.mjs" ]; then
  echo "Lint reminder: ESLint config detected. Run your linter."
elif [ -f "$REPO_ROOT/pyproject.toml" ] && grep -q "ruff\|black\|flake8" "$REPO_ROOT/pyproject.toml" 2>/dev/null; then
  echo "Lint reminder: Python linter config detected in pyproject.toml."
elif [ -f "$REPO_ROOT/.prettierrc" ] || [ -f "$REPO_ROOT/prettier.config.js" ]; then
  echo "Format reminder: Prettier config detected."
fi
