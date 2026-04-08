#!/bin/bash
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
MODIFIED=$(git diff --name-only 2>/dev/null || echo "none")
STAGED=$(git diff --cached --name-only 2>/dev/null || echo "none")

# Reset dirty counter
mkdir -p .claude/state
echo 0 > .claude/state/dirty.txt

# Write basic handoff shell — Claude fills in the prose sections via /project:handoff
# This is a fallback only — /project:handoff should be run before session ends
if [ "$1" = "precompact" ]; then
  TRIGGER="PreCompact auto-trigger"
else
  TRIGGER="Normal session stop"
fi

cat >> .claude/handoff.md << EOF

---
## Auto-logged by stop.sh
Timestamp: $TIMESTAMP
Trigger: $TRIGGER
Git modified: $MODIFIED
Git staged: $STAGED
EOF
