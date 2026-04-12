Maintain project memory across sessions. Use `.claude/state/` as persistent storage.

**On session start:**
- Read PROGRESS.md, tasks.md, and handoff.md if they exist.
- Summarize current state to the user in 2-3 sentences.

**During session:**
- After completing a task, check it off in tasks.md.
- After any significant decision, append a one-liner to PROGRESS.md with the date.

**On session end:**
- Update PROGRESS.md with what was accomplished.
- Write handoff.md via the /handoff command.

Never delete history from PROGRESS.md — append only. It's the project's changelog.
