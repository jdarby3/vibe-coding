# Vibe Coding Starter

A Claude Code starter kit. Drop the `.claude/` folder into any repo and get a structured, opinionated AI coding workflow out of the box.

## How to use

1. Copy the `.claude/` folder into the root of your repo
2. Commit and push it
3. Open Claude Code and start building

That's it.

## What's inside

```
.claude/
├── CLAUDE.md          # Project instructions Claude reads every session
├── setup.sh           # One-time setup script
├── rules/
│   ├── conventions.md # Code style and git conventions
│   └── framework.md   # Stack and architecture decisions (edit this)
├── skills/            # Slash commands: /prd, /scaffold, /idea, etc.
├── commands/          # Built-in workflows: /blueprint, /debug, /deploy, /handoff
├── hooks/             # Auto-run scripts on tool use and session stop
├── state/
│   ├── PROGRESS.md    # Append-only changelog Claude updates as it works
│   └── tasks.md       # Current task list
└── settings.json      # Claude Code settings and hook configuration
```

## Workflow

Each session Claude will:

1. Read `PROGRESS.md` and `tasks.md` to orient itself
2. Confirm a plan before writing any code
3. Update `PROGRESS.md` after each task
4. Write a handoff note at the end of the session

## Customise it

- Edit `rules/framework.md` to describe your stack (language, framework, database, patterns)
- Edit `rules/conventions.md` to match your team's code style
- Add your own skills to `skills/` — any `.md` file becomes a `/skill-name` command
