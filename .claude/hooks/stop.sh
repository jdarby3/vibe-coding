#!/usr/bin/env bash
# Runs when Claude Code session ends.
# Creates state/ if missing, then stamps a session-end breadcrumb.

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
STATE_DIR="$REPO_ROOT/.claude/state"
PROGRESS="$STATE_DIR/PROGRESS.md"

mkdir -p "$STATE_DIR"

if [ ! -f "$PROGRESS" ]; then
  printf '# Progress\n\n<!-- Append-only changelog. Never delete entries. -->\n' > "$PROGRESS"
fi

printf '\n<!-- session ended: %s -->\n' "$(date -u '+%Y-%m-%d %H:%M UTC')" >> "$PROGRESS"
