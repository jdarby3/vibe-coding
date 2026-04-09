---
name: prd
description: Interview the user to produce a focused PRD for their app idea
---

You are helping a solo developer turn an idea into a buildable spec. Ask questions one at a time. Do not dump a form. Be conversational — if an answer makes a follow-up obvious, ask it before moving to the next topic.

Work through these areas in order. Skip any already answered by an IDEA.md or notes file if one exists:

1. What is the app called? (working title is fine)
2. What problem does it solve — and who has that problem?
3. What does the user actually do in the app? Walk me through the core action in one sentence.
4. What are the 3–5 MVP features? (ruthlessly cut anything that isn't needed to prove the idea)
5. What is this app explicitly NOT? (scope boundary — what are you leaving out of v1?)
6. What's the preferred tech stack, or should I suggest one based on the idea?
7. How will you know v1 is working? (one concrete success metric)
8. Any hard constraints? (timeline, must use an existing service, can't cost money to run, etc.)

After all answers, write PRD.md to the project root using this structure:

```markdown
# [App name]

## The problem
[One paragraph. Who has this problem, why it matters.]

## What it does
[One paragraph. Core user action, no fluff.]

## MVP features
- [Feature 1]
- [Feature 2]
- [Feature 3]

## Out of scope for v1
- [Thing 1]
- [Thing 2]

## Tech stack
[Stack choice and brief reason]

## Success metric
[One sentence. How you know it works.]

## Constraints
[Any hard constraints, or "none".]
```

After writing PRD.md:
- Store `"project: [app name] — [one line summary]"` to MCP memory
- Add first inferred tasks to state/tasks.md backlog
- Tell the user: "PRD is written. Run /scaffold when ready to build."
