---
name: parallel
description: Decompose a large task into parallel subagent workstreams using git worktrees
---

Use this skill when a task has multiple independent components that can be built simultaneously — for example: backend + frontend + tests, or multiple unrelated features.

## When to use parallel agents
- Task has 2+ components with no shared files during build
- Each component can be spec'd clearly upfront
- Total task would take more than ~30 minutes sequentially

## When NOT to use parallel agents
- Components share files or depend on each other's output
- Task is exploratory or unclear — clarify first, then parallelise
- Task is simple enough to do sequentially in under 15 minutes

## Parallel execution process

### 1. Decompose
Break the task into isolated workstreams. Each workstream must:
- Touch different files from every other workstream
- Have a clear, self-contained spec
- Have a defined "done" state

Write the decomposition out explicitly before proceeding. Example:
```
Workstream A: /src/api/auth.ts — JWT middleware and route handlers
Workstream B: /src/components/Login.tsx — login form UI
Workstream C: /tests/auth.test.ts — unit tests for auth logic
```

### 2. Set up git worktrees
For each workstream, create an isolated worktree on a new branch:

```bash
# From the project root
git worktree add ../worktree-A -b agent/workstream-a
git worktree add ../worktree-B -b agent/workstream-b
git worktree add ../worktree-C -b agent/workstream-c
```

### 3. Launch subagents
Spawn one subagent per workstream. Each subagent receives:
- The full workstream spec
- Its worktree path
- The relevant section of CLAUDE.md
- Instruction to write ONLY to its assigned files

### 4. Orchestrate
While subagents work:
- Monitor for conflicts or blockers
- Do not intervene unless a subagent is blocked
- Log progress to state/PROGRESS.md

### 5. Merge and clean up
When all workstreams complete:

```bash
# Merge each branch
git merge agent/workstream-a
git merge agent/workstream-b
git merge agent/workstream-c

# Remove worktrees
git worktree remove ../worktree-A
git worktree remove ../worktree-B
git worktree remove ../worktree-C

# Delete agent branches
git branch -d agent/workstream-a agent/workstream-b agent/workstream-c
```

Resolve any merge conflicts, run tests, then update state/tasks.md and store a session summary to MCP memory.

## Subagent context template

Give each subagent exactly this context — no more, no less:

```
You are a subagent working on [WORKSTREAM NAME].
Your worktree is at: [WORKTREE PATH]
Your assigned files are: [FILE LIST]
Your spec: [SPEC]
When done, write a completion summary to [WORKTREE PATH]/DONE.md
Do not touch any files outside your assigned list.
```
