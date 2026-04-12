# Vibe Coding Starter

A Claude Code starter kit. Drop the `.claude/` folder into any repo and get a structured, opinionated AI coding workflow out of the box.

## How to use

1. Copy the `.claude/` folder into the root of your repo
2. Run `claude` or `claude --dangerously-skip-permissions` for speed

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
├── settings.json          # Full permissions (Bash, Computer, Mcp) + hooks
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
│   ├── parallel.md        # Plan parallel vs sequential tasks
│   ├── worktree.md        # Spin up a parallel Claude worktree session
│   ├── worktree-merge.md  # Merge a worktree branch back to main
│   └── setup-mcp.md       # Connect external tools via MCP
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

## Solo dev workflow guide

This is where the setup pays off. The config is only useful if you know how to work with it.

**Parallel instances.** Open 2–3 terminal panes each running `claude`. One builds a feature, another writes tests, a third handles docs or research. Run `/worktree` to spin up an isolated branch and directory for each instance — Claude handles the `git worktree` setup and tells you exactly where to open the new terminal. When a feature session is done, run `/worktree-merge` and Claude commits pending work, runs tests, reviews the diff, merges back to main, removes the worktree, and tells you to close the terminal. You never touch git directly. This is the single biggest productivity multiplier — you stop waiting for Claude to finish one thing before starting another.

**The two-session pattern.** Session A writes the code. Close it. Open Session B fresh and have it review Session A's work like a staff engineer who has never seen the implementation. A fresh context catches things the `/review` command within the same session can't, because it has no sunk cost in the choices Session A made. Use `/review` for quick pre-commit checks; use a fresh session for serious review of complex features or before merging anything significant.

**Interview-driven specs.** Don't write specs yourself. Open a session and say: "I want to build X. Interview me — ask about edge cases, tradeoffs, and technical constraints. Don't ask obvious questions. When done, write the spec to `.claude/state/prd.md`." Then close that session and open a fresh one to execute against the spec. The `/prd` command does a version of this, but the key insight is separating the interview from the execution — the executing session starts with a complete spec instead of a context full of exploration and half-formed ideas.

**`ultrathink` for hard decisions.** When facing a real architectural choice — database schema, auth design, API shape, "should I use X or Y" — prefix your message with "think hard" or "ultrathink" to activate extended reasoning. Don't use it for routine coding; it burns context for no gain on straightforward tasks. Save it for the decisions that are expensive to undo.

**Session continuity.** `claude --continue` resumes your last session. `claude --resume` shows a list of past sessions to pick from. Both are faster than starting fresh and reading handoff notes for short breaks. Use `/handoff` for end-of-day or multi-day breaks where you want a clean, documented starting point next time.

**`/loop` for monitoring.** After deploying, run `/loop 5m check if the deploy succeeded and report back`. It polls in the background while you keep working. Works the same for watching a CI pipeline or waiting on a long build: `/loop 2m check if the GitHub Actions run on the main branch has finished and tell me the result`.

**MCP servers.** Run `/setup-mcp` to connect external tools — GitHub, Playwright, filesystem, or anything else. Claude will ask what you want, run the setup, and walk you through any auth needed.

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
| `/worktree` | Spin up a new git worktree for a parallel Claude session |
| `/worktree-merge` | Merge a worktree branch back to main and clean up |
| `/setup-mcp` | Connect external tools via MCP (GitHub, Playwright, etc.) |

## Customise it

- Run `/setup-stack` to fill in your language, framework, and database
- Edit `rules/conventions.md` to match your team's code style
- Add commands to `commands/` — any `.md` file becomes a `/command-name` slash command
- Add agents to `agents/` — any `.md` with YAML frontmatter becomes a sub-agent
- Add logic to `hooks/post-tool-use.sh` — runs after every file write

## Permissions

The default grants full permissions — `Bash`, `Computer`, and `Mcp` — because this setup is designed for speed. This is the settings-file equivalent of `claude --dangerously-skip-permissions`.

- **Bash**: run shell commands (build, test, lint, git, etc.)
- **Computer**: read and write files, edit code
- **Mcp**: connect to external tools via MCP servers (GitHub, browser automation, etc.)

To restrict what Claude can do without prompting, edit `permissions.allow` in `.claude/settings.json`.
