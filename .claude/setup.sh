#!/usr/bin/env bash
# Run once after pasting .claude/ into a repo.
# Symlinks required root-level files so Claude Code can find them.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

link_or_copy() {
  local src="$SCRIPT_DIR/$1" dst="$REPO_ROOT/$2"
  if [ -e "$dst" ]; then
    echo "  skip $2 (already exists)"
  else
    ln -s ".claude/$1" "$dst" 2>/dev/null || cp "$src" "$dst"
    echo "  link $2"
  fi
}

echo "Setting up Claude Code config..."
link_or_copy "CLAUDE.md"       "CLAUDE.md"
link_or_copy "mcp.json"        ".mcp.json"

# Ensure .gitignore includes state files
if [ -f "$REPO_ROOT/.gitignore" ]; then
  grep -q ".claude/state/" "$REPO_ROOT/.gitignore" || echo -e "\n# Claude Code state\n.claude/state/\n.claude/settings.local.json" >> "$REPO_ROOT/.gitignore"
else
  echo -e "# Claude Code state\n.claude/state/\n.claude/settings.local.json" > "$REPO_ROOT/.gitignore"
fi

echo "Done. Start Claude Code and go."
