# CLAUDE.md

This is a solo [STACK] project. Single developer. Claude operates with full autonomy during execution.

## Session Protocol

- **On session start:** Read `.claude/PROGRESS.md` to restore context.
- If `.claude/handoff.md` contains any non-empty sections, read it in full before doing anything else this session.
- **On session end:** Update `.claude/PROGRESS.md` with a summary of what was done, decisions made, and what's next.

## Planning Rule

Before any significant change — new page, refactor, new data model, new dependency — write a plan using `/project:blueprint` and wait for explicit approval before implementing. Do not begin implementation speculatively.

## Decision Making

Never ask clarifying questions mid-task. Make a reasonable call, note it, and continue. Maximum one question per response, only if it is truly blocking.

## Rules

@.claude/rules/conventions.md

## Commands

- `/project:blueprint` — structured planning checkpoint before significant changes; write a plan and wait for approval before implementing
- `/project:deploy` — typecheck + lint + build, then update PROGRESS.md
- `/project:debug` — focused debugging workflow; reproduce, trace, scope, apply, verify
- `/project:handoff` — write a full prose handoff to .claude/handoff.md before ending a session or at 70% context. Always run this before starting a fresh session.

## Hooks

- `stop.sh` — fires on Stop and PreCompact, writes .claude/handoff.md automatically
- `post-tool-use.sh` — fires after every tool use, tracks tool call count and warns when /compact is needed

## Skills

- `grill-me` — use before starting any new feature to clarify requirements and surface assumptions
- `write-a-prd` — use when a feature needs a formal requirements document
- `prd-to-plan` — use to turn a PRD into a phased implementation plan
- `prd-to-issues` — use to break a plan into discrete trackable issues

## Compact Instructions

Preserve: current task, files modified, decisions made, next action.
Discard: tool output details, file contents already committed, resolved errors.
Always write .claude/handoff.md before compacting.
At 70% context usage, stop all current work. Write a full handoff by running /project:handoff. Then ask the user: "Context is at 70% — handoff written to .claude/handoff.md. Continue here with a smaller task, or spin up a fresh session?"
Do not auto-compact. Do not continue the current task. Wait for user input.

## Context Awareness

- At 70% context usage: stop current task, run /project:handoff, then ask the user whether to continue with a small task or end the session. Do not proceed with large tasks above 70%.
- At 50% context usage: note it internally, finish the current atomic task, then run /project:handoff as a checkpoint before starting anything new.
- Small tasks (single file edits, quick fixes, questions) are always fine regardless of context level.
- Never auto-compact without running /project:handoff first.

## Task Queue

On session start, read .claude/tasks.md. Pop the top unchecked task and work on it. When complete, check it off and move to the next.
