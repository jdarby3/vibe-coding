# CLAUDE.md
<!-- 
  This file is the single source of truth for how Claude behaves in this project.
  Copy it into any new project, fill in the placeholders, and Claude will follow it.
  Lines starting with <!-- are comments and won't affect Claude's behavior.
-->

---

## Project Overview
<!-- 
  1–3 sentences describing what this project is and what it does.
  Be specific: "A Next.js SaaS app for tracking freelance invoices" is better than "a web app".
-->

> TODO: Describe your project here.

---

## Tech Stack
<!--
  List your exact stack so Claude doesn't suggest things you're not using.
  Examples shown — replace with your actual choices.
-->

| Layer        | Choice                        |
|--------------|-------------------------------|
| Framework    | Next.js 14 (App Router)       |
| Language     | TypeScript                    |
| Styling      | Tailwind CSS + shadcn/ui      |
| Database     | Postgres via Prisma ORM       |
| Auth         | Clerk                         |
| Hosting      | Vercel                        |
| Testing      | Vitest + React Testing Library|

> TODO: Replace the rows above with your actual stack.

---

## Commands
<!--
  Tell Claude exactly how to build, run, and test this project.
  Claude will use these commands rather than guessing.
-->

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Type-check (run before marking any task done)
npm run typecheck

# Lint (run before marking any task done)
npm run lint

# Run tests
npm test

# Build for production
npm run build
```

> TODO: Update these commands to match your package.json scripts.

---

## Code Style and Conventions

<!-- Claude reads these rule files for detailed conventions. -->
@.claude/rules/conventions.md
@.claude/rules/framework.md

<!-- Add any project-specific overrides here. These take precedence over the rule files. -->
<!-- Example: "Use `zod` for all runtime validation, never `yup`." -->

---

## What Claude Must Never Do
<!--
  Hard stops. Claude will not do these things even if asked mid-task.
  Customize this list for your project.
-->

- **Never touch `.env` or `.env.local`** — environment variables are managed manually.
- **Never run database migrations** (`prisma migrate`, `db push`, etc.) without explicit user approval.
- **Never install a new npm package** without naming it and waiting for a thumbs-up first.
- **Never delete files** — move them to `_archive/` if they need to be removed.
- **Never commit or push to git** unless explicitly asked.
- **Never modify CI/CD config** (`.github/workflows/`, `vercel.json`, etc.) without approval.
- **Never use `any` types** in TypeScript — use `unknown` and narrow, or define a proper type.

> TODO: Add any project-specific restrictions (e.g. "never touch the billing module without asking").

---

## Memory System

This project uses a two-layer memory system.

### Layer 1 — MCP memory (primary cross-session memory)

The `memory` MCP server is a persistent knowledge graph. Use it every session.

**At the START of every session:**
- Query: `"what do you know about this project?"`
- Query: `"what were the last decisions made?"`
- Surface relevant findings before any work begins.

**During a session** — proactively store:
- Architectural decisions: *"we chose Postgres over SQLite because X"*
- Constraints and gotchas: *"the payments module requires approval before changes"*
- Anything non-obvious that would take time to re-explain next session

**At the END of every session:**
- Store: `"session summary [date]: built X, decided Y, next step is Z"`
- Update `state/tasks.md` — move completed tasks to Done, add new ones to Backlog.

### Layer 2 — state/ files (human-readable log)

These files are for the developer to skim, not for Claude's primary context.

- **`state/PROGRESS.md`** — append-only log of completed work. Claude appends here as it builds.
- **`state/tasks.md`** — kanban board: Backlog / In Progress / Done.

---

## Parallel Execution

For large tasks with independent components, use `/project:parallel` to decompose and run subagents in isolated git worktrees.

Rules:
- Always decompose on paper before spawning any agents
- Never let two agents touch the same file
- Always clean up worktrees and branches after merging
- Store a session summary to MCP memory after every parallel run
- Update `state/tasks.md` and `state/PROGRESS.md` after merge

When in doubt about whether to parallelise — don't. Clarify the task first.

---

## Decision Making

- Before any significant change — new page, new data model, major refactor, new dependency — pause and write out the plan. Wait for explicit approval before implementing.
- Never ask clarifying questions mid-task. Make a reasonable call, note it in the response, and continue.
- Maximum one question per response, and only if it is truly blocking.

---

## Hooks
<!-- These run automatically — no action needed. -->

- `stop.sh` — fires on Stop and PreCompact; resets the tool-call counter and logs session metadata.
- `post-tool-use.sh` — fires after every tool use; logs file writes to `state/PROGRESS.md`.

---

## Skills (Slash Commands)

| Command               | What it does                                                                      |
|-----------------------|-----------------------------------------------------------------------------------|
| `/project:idea`       | Read a raw ideas file and transition into PRD creation                            |
| `/project:grillme`    | Interrogate requirements before coding — surfaces gaps and assumptions            |
| `/project:prd`        | Interview you and write a `PRD.md` in the project root                            |
| `/project:scaffold`   | Read `PRD.md` and propose a full project scaffold                                 |
| `/project:parallel`   | Decompose a large task into parallel subagent workstreams using git worktrees     |
| `/project:blueprint`  | Write a plan for a significant change and wait for approval                       |
| `/project:memory`     | Query or update the MCP knowledge graph                                           |

---

## Compact Instructions
<!-- What Claude should preserve vs. discard when the context gets compressed. -->

Preserve: current task, files modified, decisions made, next action.
Discard: full tool output, file contents already committed, resolved errors.

At **70% context usage**: stop current work, store a session summary in MCP memory, then ask:
> "Context is at 70% — session stored to memory. Continue with a smaller task, or start a fresh session?"

At **50% context usage**: note it internally, finish the current atomic task, then store a memory checkpoint before starting anything new.
