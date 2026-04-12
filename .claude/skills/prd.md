Write a Product Requirements Document. Ask the user enough questions to fill this structure, then write it to `.claude/prd.md`:

## PRD: [Title]

### Problem
What problem are we solving? For whom? How do we know it's a real problem?

### Success Metrics
How do we measure if this worked? Be specific (numbers, not vibes).

### Scope
**In scope**: what we're building.
**Out of scope**: what we're explicitly not building (and why).

### User Stories
As a [persona], I want [action] so that [outcome]. List 3-7 stories.

### Technical Approach
High-level architecture. Key technical decisions and tradeoffs. Dependencies.

### Risks & Open Questions
What could go wrong? What don't we know yet?

### Milestones
Break the work into 2-4 phases with clear deliverables.

---

After writing the PRD, ask the user: "Want me to grill this?" If yes, run the grillme skill against it.
