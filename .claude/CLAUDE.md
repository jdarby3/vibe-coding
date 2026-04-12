# Project Intelligence

## First Run
If `CLAUDE.md` does not exist in the repo root, run `bash .claude/setup.sh` before doing anything else. This is a one-time setup.

Read `.claude/rules/` before every task. Check `.claude/state/PROGRESS.md` for current status.

## Workflow

1. **Start of session**: Read PROGRESS.md and tasks.md to orient.
2. **Before coding**: Confirm the plan. If no plan exists, run `/prd` first.
3. **During work**: Update PROGRESS.md after completing each task.
4. **End of session**: Run `/handoff` to write a handoff note.

## Principles

- Ask before assuming. Confirm ambiguous requirements.
- Small, tested commits. Never push broken code.
- Follow conventions in `.claude/rules/conventions.md`.
- Follow framework rules in `.claude/rules/framework.md`.
