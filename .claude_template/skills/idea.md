---
name: idea
description: Read a raw ideas file and transition into structured PRD creation
---

The user has dropped a file of rough notes, ideas, or stream-of-consciousness thoughts about an app they want to build. Your job is to extract signal and move smoothly into PRD creation without losing momentum.

## Process

### 1. Find the ideas file

Look for any of these in the project root (in order of priority):
- `IDEA.md`
- `idea.md`
- `notes.md`
- `NOTES.md`
- `input.md`
- Any `.md` or `.txt` file that is not `CLAUDE.md`, `README.md`, `PRD.md`, or a template file

If multiple candidates exist, ask the user which one to use. Otherwise proceed silently.

### 2. Read and extract

Read the file fully. Extract:
- The core problem being solved
- Who it's for
- Any mentioned features (label them MVP vs nice-to-have based on context)
- Any mentioned constraints (tech stack, timeline, budget, existing systems)
- Anything explicitly ruled out
- Any open questions the user seemed uncertain about

### 3. Reflect back concisely

In 4–6 sentences, summarise what you understood. Flag anything ambiguous.
Do not ask questions yet — just reflect.

### 4. Transition to /prd

Say: "I have enough to start the PRD interview. I'll ask you a few focused questions to fill in the gaps — skip any that the notes already answered."

Then run the `/prd` skill, but skip any questions already answered by the ideas file. Pre-fill those answers silently.

### 5. When PRD.md is written

- Store `"project overview: [one sentence summary]"` to MCP memory
- Update `state/tasks.md` Backlog with the first 5 inferred tasks
- Tell the user: "Run `/scaffold` when you're ready to start building."
