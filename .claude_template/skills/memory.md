---
name: memory
description: Query or update the MCP knowledge graph for this project
---

Use the memory MCP server to manage cross-session project knowledge.

## Commands

- **"what do you know about X"** → query the knowledge graph for entities related to X
- **"remember that X"** → store as a new entity or relation
- **"forget X"** → delete the relevant entity
- **"dump memory"** → list all stored entities and relations
- **"end session"** → store a session summary: date, what was built, what's next

## Session start ritual

Run automatically at the start of every new session, before any work begins:

1. Query memory: `"what do you know about this project?"`
2. Query memory: `"what were the last decisions made?"`
3. Read `state/tasks.md` for current in-progress items
4. Briefly surface findings to the user before starting work

## During a session — what to store

Proactively store anything non-obvious that would take time to re-explain next session:

- Architectural decisions: `"we chose Postgres over SQLite because the app needs concurrent writes"`
- Constraints and gotchas: `"the payments module requires explicit approval before any changes"`
- Key entities: the main data models, external services, tricky integrations
- Anything that looks wrong but is intentional

## At the end of every session

Store a session summary:

> "Store: session summary [YYYY-MM-DD] — built X, decided Y, next step is Z"

Then update `state/tasks.md` (move completed tasks to Done, add newly discovered tasks to Backlog).

## What NOT to store in MCP

- File contents — read the file
- Git history — use `git log`
- In-progress work state — that's `state/tasks.md`

## Layer 2 reminder

`state/PROGRESS.md` and `state/tasks.md` are human-readable logs — they exist for the developer's benefit, not Claude's. MCP memory is Claude's source of truth for cross-session context.
