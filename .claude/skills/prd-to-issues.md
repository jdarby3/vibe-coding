Read `.claude/prd.md` and `.claude/state/tasks.md`. Convert each task into a GitHub-issue-ready format:

```
### [Task Title]
**Type**: feature | bug | chore
**Priority**: P0 | P1 | P2
**Estimate**: S | M | L

**Description**:
[1-3 sentences]

**Acceptance Criteria**:
- [ ] Criterion 1
- [ ] Criterion 2

**Dependencies**: #issue-number or "none"
```

Group issues by milestone from the PRD. Output to `.claude/state/issues.md`.

If GitHub CLI (`gh`) is available, ask the user if they want to create the issues directly.
