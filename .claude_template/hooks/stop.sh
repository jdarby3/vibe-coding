#!/bin/bash
# stop.sh — fires on Stop and PreCompact
# Resets the tool-call counter and logs session metadata for reference.
# Cross-session memory is handled by MCP (memory server), not this file.

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
MODIFIED=$(git diff --name-only 2>/dev/null || echo "none")
STAGED=$(git diff --cached --name-only 2>/dev/null || echo "none")

mkdir -p .claude/state
echo 0 > .claude/state/dirty.txt

if [ "$1" = "precompact" ]; then
  TRIGGER="PreCompact auto-trigger"
else
  TRIGGER="Normal session stop"
fi

# Log to stdout so the event is visible in Claude Code's hook output
echo "[$TIMESTAMP] stop.sh fired — trigger: $TRIGGER"
echo "  Modified: $MODIFIED"
echo "  Staged:   $STAGED"
