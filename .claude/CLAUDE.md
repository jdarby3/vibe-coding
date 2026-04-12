# Project Intelligence

## Auto-Start — run this immediately, every session, without being asked

1. Read `.claude/state/PROGRESS.md` and `.claude/state/tasks.md` (create them if missing).
2. **If `.claude/prd.md` does not exist** → run `/prd` to gather requirements before anything else.
3. **If `prd.md` exists but `tasks.md` is empty** → run `/prd-to-plan` to generate the task list.
4. **If tasks exist** → state what the next unchecked task is and ask the user to confirm before starting.

Do not greet the user generically. Orient, report status, propose the next action.

## During Work

- Update `.claude/state/PROGRESS.md` after each task (append-only — never delete history).
- Check off tasks in `.claude/state/tasks.md` as completed.
- Ask before assuming. Confirm ambiguous requirements before writing code.
- Small, tested commits. Never push broken code.

## End of Session

Run `/handoff` before ending. This is mandatory.

---

## Code Conventions

- Naming: camelCase for JS/TS, snake_case for Python.
- Prefer explicit over clever. No magic numbers — use named constants.
- Functions under 40 lines. Extract when longer.
- Imports sorted: stdlib → external → internal.
- Never swallow errors silently. Log context: what was attempted, what failed, with what input.

## Git

- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.
- One logical change per commit.
- Never commit secrets, env files, or node_modules.

## Stack (fill in when starting a project)

- Language:
- Framework:
- Database:
- Styling:
- Preferred libraries:
- Patterns to avoid:
