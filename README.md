# Vibe Coding Starter

A Claude Code starter kit. Drop the `.claude/` folder into any repo and get a structured, opinionated AI coding workflow out of the box.

## How to use

1. Copy the `.claude/` folder into the root of your repo
2. Run `claude`

That's it. No setup script. No manual steps.

## What's inside

```
.claude/
├── CLAUDE.md        # Auto-start instructions, conventions, and stack template
├── settings.json    # Claude Code permissions and hook configuration
├── commands/        # Slash commands: /prd, /handoff, /debug, /scaffold, /idea, etc.
└── hooks/
    ├── stop.sh      # Stamps session-end breadcrumb; auto-creates state/ on first run
    └── post-tool-use.sh  # Runs after every file write (add lint, checks, etc.)
```

`state/` is created automatically on first session — it's not in the repo.

## What happens when you run claude

1. Claude reads `state/PROGRESS.md` and `state/tasks.md` (creates them if missing)
2. No PRD? → runs `/prd` to gather requirements
3. PRD exists, no tasks? → runs `/prd-to-plan` to generate a task list
4. Tasks exist? → reports current status and proposes the next task
5. Session ends → hook stamps a breadcrumb; Claude writes a handoff note

## Customise it

- Edit the **Stack** section in `CLAUDE.md` to describe your language, framework, and database
- Edit the **Code Conventions** section in `CLAUDE.md` to match your team's style
- Add commands to `commands/` — any `.md` file becomes a `/command-name` slash command
- Add logic to `hooks/post-tool-use.sh` — runs after every file write (e.g. auto-lint)

## Available slash commands

| Command | What it does |
|---|---|
| `/prd` | Write a Product Requirements Document |
| `/prd-to-plan` | Break the PRD into a task checklist |
| `/prd-to-issues` | Convert tasks to GitHub issue format |
| `/scaffold` | Generate initial project file structure |
| `/idea` | Shape a raw idea before committing to a PRD |
| `/grillme` | Stress-test your idea or plan |
| `/blueprint` | Map the current codebase structure |
| `/debug` | Systematic bug investigation |
| `/deploy` | Pre-deploy checklist |
| `/handoff` | Write a handoff note for the next session |
| `/memory` | Review and update session memory |
| `/parallel` | Plan parallel vs sequential task execution |
