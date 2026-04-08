#!/bin/bash
COUNTER_FILE=".claude/state/dirty.txt"
mkdir -p .claude/state
COUNT=$(cat "$COUNTER_FILE" 2>/dev/null || echo 0)
COUNT=$((COUNT + 1))
echo $COUNT > "$COUNTER_FILE"

# Warn at 20 tool calls — soft nudge
if [ "$COUNT" -eq 20 ]; then
  echo "⚠️  20 tool calls this session — watch context usage" >> .claude/handoff.md
fi

# Warn at 40 tool calls — stronger nudge
if [ "$COUNT" -eq 40 ]; then
  echo "⚠️  40 tool calls — context likely above 60%, consider /project:handoff soon" >> .claude/handoff.md
fi
