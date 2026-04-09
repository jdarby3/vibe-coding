#!/bin/bash
# post-tool-use.sh — runs after every Claude tool use
# Logs file writes to state/PROGRESS.md for human visibility

TOOL="$1"
INPUT="$2"

if [[ "$TOOL" == "Write" || "$TOOL" == "Edit" ]]; then
  if [ -f "state/PROGRESS.md" ]; then
    echo "- [$(date '+%Y-%m-%d %H:%M')] Modified: $INPUT" >> state/PROGRESS.md
  fi
fi
