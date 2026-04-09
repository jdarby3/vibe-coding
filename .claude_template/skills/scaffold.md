---
name: scaffold
description: Read PRD.md and propose a full project folder structure — waits for approval before touching files
---

# Skill: /project:scaffold
<!--
  Invoke with: /project:scaffold
  Purpose: Read PRD.md and propose a full project scaffold before touching any files.
  Run this after /project:prd has produced a PRD.md.
-->

When this skill is invoked, follow these steps exactly. Do not create or modify any files until the user explicitly approves.

---

## Step 1 — Read the PRD

Read `PRD.md` from the project root. If it doesn't exist, say:

> "I don't see a `PRD.md` in the project root. Run `/project:prd` first to create one, then come back to `/project:scaffold`."

Stop here if there's no PRD.

---

## Step 2 — Confirm the stack

State the tech stack you read from the PRD:

> "Based on the PRD, the stack is: [list the stack]. Is this still correct, or has anything changed?"

Wait for confirmation. Adjust if needed.

---

## Step 3 — Propose a folder structure

Propose a folder structure appropriate for the confirmed stack. Present it as a tree, with a one-line comment explaining each top-level folder's purpose. For example (Next.js App Router):

```
my-app/
├── app/                    # Next.js App Router — pages, layouts, loading/error states
│   ├── (auth)/             # Route group: auth flows (login, signup, reset)
│   ├── dashboard/          # Main app section post-login
│   └── api/                # API route handlers
├── components/
│   ├── ui/                 # Generic, reusable UI primitives (buttons, inputs, modals)
│   └── features/           # Domain-specific feature components
├── lib/                    # Shared utilities, helpers, and service clients
├── hooks/                  # Custom React hooks
├── types/                  # TypeScript type definitions
├── prisma/                 # Database schema and migrations
├── public/                 # Static assets
└── .claude/                # Claude's memory, rules, skills, and hooks
    ├── state/
    │   ├── PROGRESS.md     # Human-readable build log
    │   └── tasks.md        # Kanban task board
    ├── rules/
    ├── hooks/
    └── skills/
```

Adapt this to the actual stack from the PRD — don't blindly use the Next.js example if the project is React Native, FastAPI, etc.

---

## Step 4 — List the first 5 tasks

After the folder structure, list the first 5 concrete implementation tasks you plan to execute, in order. Format them as a numbered list with a brief description of what each task does and why it comes first. For example:

1. **Initialise the project** — run `create-next-app` with TypeScript, Tailwind, and ESLint; commit the baseline.
2. **Configure the database** — add Prisma, write the initial schema based on the PRD's core entities, run the first migration.
3. **Set up auth** — integrate Clerk (or chosen auth provider); protect routes; create session context.
4. **Scaffold core pages** — create the folder structure and empty route files for every page listed in the PRD.
5. **Build the first feature** — implement the highest-priority MVP feature end-to-end (UI → API → DB).

Tailor the tasks to the actual PRD content.

---

## Step 5 — Ask for approval

Say:

> "Here's my plan for the folder structure and first 5 tasks. A few things before I start:
> - I won't create, move, or delete any files until you approve.
> - If anything in the structure looks wrong, tell me now — it's much cheaper to change the plan than the code.
> - Once you approve, I'll work through the tasks in order, checking in after each one.
>
> Shall I proceed?"

**Do not touch any files until the user says yes.**

---

## Step 6 — Execute with checkpoints

Once approved:
- Create the folder structure and baseline files.
- Work through the task list one task at a time.
- After each task, briefly state what was done and what's next, then pause for a go-ahead before continuing.
- Update `.claude/state/tasks.md` and `.claude/state/PROGRESS.md` after each task completes.
