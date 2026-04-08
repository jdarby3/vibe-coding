# /project:handoff

You are about to end or pause a session. Write a complete handoff to .claude/handoff.md.

Do not use the shell script. Write the file yourself with full prose in each section:

## Timestamp
[current date and time]

## Active Task
[one paragraph describing exactly what was being worked on, with enough detail that a fresh Claude instance could continue without asking questions]

## Files Modified
[list every file touched this session with one line describing what changed in each]

## Completed
[bullet list of everything finished this session]

## In Progress
[bullet list of everything started but not finished, with current status of each]

## Next Action
[single most important thing the next session should do first — be specific, name the file and function if relevant]

## Decisions Made
[every autonomous decision made this session and the reasoning behind it]

## Context for Next Session
[anything the next Claude instance needs to know that isn't captured above — gotchas, half-finished thoughts, open questions]

After writing the file, confirm: "Handoff written. Safe to start a fresh session or continue with a small task."
