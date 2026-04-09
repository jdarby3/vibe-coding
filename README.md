# Vibe coding starter

A Claude Code starter for solo developers. Drop in an idea, answer some questions, start building.

---

## Quickstart

1. Clone this repo into your new project folder
2. Set your GitHub PAT in your shell:
   `export GITHUB_PAT=ghp_yourtoken` (add to `~/.bashrc` to persist)
3. Create the memory directory:
   `mkdir -p ~/.claude-memory`
4. Fill in `CLAUDE.md` — your stack, your constraints, what Claude should never touch
5. Drop your idea into `IDEA.md` (rough notes are fine)
6. Open Claude Code — run `/idea` to start

That's it.

---

## The workflow

```
IDEA.md  →  /idea  →  /grillme  →  /prd  →  /scaffold  →  build
```

- `/idea` — reads your notes, reflects back what it understood, kicks off the interview
- `/grillme` — stress-tests your idea before any code is written (do this, it saves time)
- `/prd` — structured interview that writes PRD.md
- `/scaffold` — reads PRD.md, proposes folder structure, waits for your approval
- `/parallel` — for large tasks: splits work across subagents in isolated git worktrees
- `/memory` — query or update what Claude knows about your project across sessions

---

## How memory works

Two layers:

**MCP knowledge graph** (`~/.claude-memory/memory.json`)
Claude's brain across sessions. Stores decisions, gotchas, architecture.
Query it: *"what do you know about this project?"*
It persists until you delete it.

**state/ files** (in this repo)
For you, not Claude. Open these to see what's happening.
- `state/PROGRESS.md` — log of what's been built
- `state/tasks.md` — kanban: Backlog / In Progress / Done

---

## MCP setup

Two servers load automatically from `.mcp.json`:

**memory** — local knowledge graph, no config needed beyond the directory above
**github** — official GitHub MCP, needs `GITHUB_PAT` in your environment

Verify both loaded: type `/mcp` inside a Claude Code session.

---

## Customising for your stack

Three places to tailor this template to how you work:

**1. CLAUDE.md** — fill in your preferred stack, commands, and rules. This is the most important file. The more specific you are here, the less you explain in every session.

**2. `.claude_template/rules/framework.md`** — add your framework-specific patterns (Next.js conventions, FastAPI structure, React Native gotchas, etc.). Claude reads this every session.

**3. `.claude_template/skills/`** — add your own slash commands. Each skill is just a markdown file:

```markdown
---
name: your-skill-name
description: One line — when should Claude use this?
---

Your instructions here. Be as specific as you would be with a senior dev.
```

Then call it with `/your-skill-name` inside Claude Code.

---

## What's in `.claude_template/`

```
skills/
  idea.md        read raw notes, transition to PRD
  prd.md         structured app interview → PRD.md
  grillme.md     stress-test your idea before building
  scaffold.md    PRD.md → proposed project structure
  parallel.md    split large tasks across subagents
  memory.md      query/update MCP knowledge graph

rules/
  conventions.md   default code style and commit format
  framework.md     your framework-specific patterns (fill this in)

hooks/
  post-tool-use.sh   logs file writes to state/PROGRESS.md
  stop.sh            runs when Claude ends a session

state/
  PROGRESS.md   human-readable build log
  tasks.md      kanban task list
```

---

## Tips

- Run `/grillme` before `/prd` on any idea you're not 100% sure about. It finds the holes.
- Keep `CLAUDE.md` updated as the project evolves. It's your main lever for steering Claude.
- At the end of long sessions, say "end session" — Claude stores a summary to memory so the next session picks up instantly.
- For big features, `/parallel` runs subagents in isolated git worktrees simultaneously. Use it when components don't share files.
- `~/.claude-memory/memory.json` is local to your machine. Back it up if the project runs long.

---

## .mcp.json

`.mcp.json` is committed — it contains no secrets, only an env var reference for the PAT. Copy `.mcp.json.example` as a starting point if you're setting this up on a new machine and need a reminder of the shape.
