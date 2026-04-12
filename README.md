# Vibe Coding Starter

A Claude Code starter kit. Drop the `.claude/` folder into any repo and get a structured, opinionated AI coding workflow out of the box.

## How to use

1. Copy the `.claude/` folder into the root of your repo
2. Run `claude`

That's it. No setup script. No manual steps.

## What happens when you run claude

1. Claude reads `state/PROGRESS.md` and `state/tasks.md` (creates them if missing)
2. Stack not configured? → prompts you to run `/setup-stack`
3. No PRD? → runs `/prd` to gather requirements
4. PRD exists, no tasks? → runs `/prd-to-plan` to generate a task list
5. Tasks exist? → reports current status and proposes the next task
6. Session ends → hook stamps a breadcrumb; Claude writes a handoff note

## What's inside

```
.claude/
├── CLAUDE.md              # Lean auto-start instructions (@imports conventions + stack)
├── settings.json          # Conservative permissions (Bash only) + hooks
├── agents/                # Sub-agents for specialised tasks
│   ├── reviewer.md        # Code review — runs before every commit
│   ├── researcher.md      # Doc/API/library research without polluting main context
│   ├── test-writer.md     # Write and run tests for a module
│   └── file-scanner.md   # Fast read-only codebase mapping (Haiku model)
├── commands/              # Slash commands
│   ├── prd.md             # Write a PRD
│   ├── prd-to-plan.md     # Break PRD into task checklist
│   ├── prd-to-issues.md   # Convert tasks to GitHub issues
│   ├── setup-stack.md     # Interactive first-run stack config
│   ├── scaffold.md        # Generate initial project structure
│   ├── idea.md            # Shape a raw idea before committing to a PRD
│   ├── grillme.md         # Stress-test your idea or plan
│   ├── test.md            # Run tests, fix failures
│   ├── review.md          # Self-review before committing
│   ├── blueprint.md       # Map the current codebase
│   ├── debug.md           # Systematic bug investigation
│   ├── deploy.md          # Pre-deploy checklist
│   ├── handoff.md         # Write session handoff note
│   ├── memory.md          # Review session memory
│   └── parallel.md        # Plan parallel vs sequential tasks
├── hooks/
│   ├── stop.sh            # Auto-creates state/; stamps session-end breadcrumb
│   └── post-tool-use.sh   # Lint/format reminder after file writes
└── rules/
    ├── conventions.md     # Code style and git conventions (@imported into CLAUDE.md)
    └── stack.md           # Your stack — filled by /setup-stack (@imported into CLAUDE.md)
```

`state/` is created automatically on first session and is gitignored (except `PROGRESS.md`).

## First run on a new project

```
/setup-stack   # Tell Claude your language, framework, database, etc.
/prd           # Define what you're building
/prd-to-plan   # Break it into tasks
/scaffold      # Generate the initial project structure
```

## Sub-agents

Sub-agents run in isolated context so they don't consume your main conversation window.

| Agent | When it activates | Model |
|---|---|---|
| `reviewer` | Before every commit (`/review` triggers it) | Sonnet |
| `researcher` | Any doc/API/library lookup | Sonnet |
| `test-writer` | Writing or updating tests | Sonnet |
| `file-scanner` | Mapping unfamiliar code | Haiku (fast + cheap) |

**Routing rules:**
- **Parallel**: 3+ independent tasks with no shared files → dispatch together
- **Sequential**: Task B needs Task A's output, or scope is unclear → one at a time
- **Background** (`Ctrl+B`): research and exploration that isn't blocking current work

## Slash commands

| Command | What it does |
|---|---|
| `/setup-stack` | Interactive stack config — run this first on a new project |
| `/prd` | Write a Product Requirements Document |
| `/prd-to-plan` | Break the PRD into a task checklist |
| `/prd-to-issues` | Convert tasks to GitHub issue format |
| `/scaffold` | Generate initial project file structure |
| `/idea` | Shape a raw idea before committing to a PRD |
| `/grillme` | Stress-test your idea or plan |
| `/test` | Run the test suite; fix any failures |
| `/review` | Self-review before committing (spawns reviewer agent) |
| `/blueprint` | Map the current codebase structure |
| `/debug` | Systematic bug investigation |
| `/deploy` | Pre-deploy checklist |
| `/handoff` | Write a handoff note for the next session |
| `/memory` | Review and update session memory |
| `/parallel` | Plan parallel vs sequential task execution |

## Customise it

- Run `/setup-stack` to fill in your language, framework, and database
- Edit `rules/conventions.md` to match your team's code style
- Add commands to `commands/` — any `.md` file becomes a `/command-name` slash command
- Add agents to `agents/` — any `.md` with YAML frontmatter becomes a sub-agent
- Add logic to `hooks/post-tool-use.sh` — runs after every file write

## Permissions

Default permissions are conservative (`Bash` only). Add `Computer` and `Mcp` to `permissions.allow` in `settings.json` if you need them.

## Context management tips

- Run `/compact` when context hits ~50% — don't wait for auto-compaction
- Use `/clear` when switching to an unrelated task mid-session
- Delegate heavy file-reading to the `file-scanner` agent to keep main context clean
