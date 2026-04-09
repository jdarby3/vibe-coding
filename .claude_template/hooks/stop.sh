#!/bin/bash
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

cat >> .claude/handoff.md << HANDOFF

---
## Auto-logged by stop.sh
Timestamp: $TIMESTAMP
Trigger: $TRIGGER
Git modified: $MODIFIED
Git staged: $STAGED
HANDOFF
