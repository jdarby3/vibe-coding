# Project Intelligence

## Auto-Start — run this immediately, every session, without being asked

1. Read `.claude/state/PROGRESS.md` and `.claude/state/tasks.md` (create them if missing).
2. If `.claude/rules/stack.md` has empty/placeholder values → prompt the user to run `/setup-stack` first.
3. If `.claude/state/prd.md` does not exist → run `/prd` before anything else.
4. If `prd.md` exists but `tasks.md` is empty → run `/prd-to-plan`.
5. If tasks exist → state the next unchecked task and ask the user to confirm before starting.

Do not greet the user generically. Orient, report status, propose the next action.

## During Work

- Update `.claude/state/PROGRESS.md` after each task (append-only — never delete history).
- Check off tasks in `.claude/state/tasks.md` as completed.
- Ask before assuming. Confirm ambiguous requirements before writing code.
- Small, tested commits. Run `/review` before every commit.

## Sub-Agent Routing

**Parallel dispatch** (all must be true): 3+ independent tasks, no shared files, no output dependencies.
**Sequential dispatch** (any triggers): Task B needs Task A's output, shared files, or unclear scope.
**Background dispatch**: research, doc lookups, codebase exploration — use when results aren't blocking.

Named agents and when to use them:
- **reviewer** — before every commit (`/review` triggers this automatically)
- **researcher** — any external API, library, or doc lookup
- **test-writer** — writing or updating tests for a module
- **file-scanner** — mapping unfamiliar code without flooding main context

Prefer the built-in Task tool with general-purpose clones for ad-hoc parallel work.

## Context Management

- Run `/compact` proactively when context reaches ~50%. Don't wait for auto-compaction.
- When compacting, preserve: current task list, modified files, test status, key decisions.
- Use `/clear` when switching to an unrelated task mid-session.
- Delegate exploration-heavy work to sub-agents to keep main context clean.

## End of Session

Run `/handoff` before ending. This is mandatory.

---

@.claude/rules/conventions.md

@.claude/rules/stack.md
