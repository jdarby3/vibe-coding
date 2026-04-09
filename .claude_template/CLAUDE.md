# CLAUDE.md

This is a solo [framework] project. Single developer. Claude operates with full autonomy during execution.

## Session Protocol

- **On session start:** Query MCP memory — "what do you know about this project?" and "what were the last decisions made?" — before doing anything else. Read `state/tasks.md` to pick up in-progress work.
- **On session end:** Store a session summary in MCP memory: date, what was built, decisions made, next step. Update `state/tasks.md`.

## Decision Making

- Before any significant change — new page, new data model, major refactor, new dependency — pause and write out the plan. Wait for explicit approval before implementing.
- Never ask clarifying questions mid-task. Make a reasonable call, note it, and continue.
- Maximum one question per response, only if it is truly blocking.

## Rules

@.claude/rules/conventions.md
@.claude/rules/framework.md

## Memory System

Two layers:

**Layer 1 — MCP memory (primary):** Persistent knowledge graph. Query at session start. Store decisions, gotchas, and architecture facts during and after every session.

**Layer 2 — state/ files (human-readable):**
- `state/PROGRESS.md` — append-only log of completed work
- `state/tasks.md` — kanban board: Backlog / In Progress / Done

## Parallel Execution

For large tasks with independent components, use `/idea`, `/parallel` to decompose work across subagents in isolated git worktrees. Never let two agents touch the same file. Clean up worktrees and branches after merging.

## Skills

- `/idea` — read raw notes file, extract signal, kick off PRD interview
- `/grillme` — stress-test the idea before writing code
- `/prd` — interview and write PRD.md
- `/scaffold` — read PRD.md, propose folder structure, wait for approval
- `/parallel` — decompose large task into isolated subagent workstreams
- `/memory` — query or update the MCP knowledge graph

## Hooks

- `stop.sh` — fires on Stop and PreCompact; resets tool-call counter, logs session metadata
- `post-tool-use.sh` — fires after every tool use; logs file writes to `state/PROGRESS.md`

## Compact Instructions

Preserve: current task, files modified, decisions made, next action.
Discard: tool output details, file contents already committed, resolved errors.

At 70% context: store a session summary to MCP memory, then ask: "Context at 70% — stored. Continue with a smaller task, or fresh session?"
