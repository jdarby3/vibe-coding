# .claude template

Drop this folder into any new repo as `.claude/` to get a fully wired Claude Code setup.

## Setup steps

1. Copy this folder to your new repo: `cp -r .claude2 /path/to/new-repo/.claude`
2. Make hooks executable: `chmod +x .claude/hooks/*.sh`
3. Edit `CLAUDE.md` — replace `[STACK]` with your actual stack (e.g. "Next.js + TypeScript + Tailwind")
4. Add any stack-specific rule files to `.claude/rules/` and reference them in `CLAUDE.md` with `@.claude/rules/yourfile.md`
5. Clear `PROGRESS.md` and `tasks.md` for the new project

## What's included

| File/Folder | Purpose |
|---|---|
| `CLAUDE.md` | Main instructions — session protocol, planning rules, command index |
| `PROGRESS.md` | Persistent session state — Claude reads/writes this every session |
| `handoff.md` | End-of-session handoff — auto-appended by hook, prose written by Claude |
| `tasks.md` | Task queue — Claude pops the top unchecked item each session |
| `settings.json` | Hook wiring — connects stop/post-tool-use scripts to Claude events |
| `hooks/stop.sh` | Fires on session Stop and PreCompact — logs git state to handoff.md |
| `hooks/post-tool-use.sh` | Fires after every tool call — warns at 20/40 calls to watch context |
| `commands/blueprint.md` | `/project:blueprint` — planning checkpoint, no code until approved |
| `commands/deploy.md` | `/project:deploy` — typecheck + lint + build + update PROGRESS.md |
| `commands/debug.md` | `/project:debug` — reproduce → trace → scope → apply → verify |
| `commands/handoff.md` | `/project:handoff` — full prose handoff before ending a session |
| `rules/conventions.md` | Code style and naming conventions — edit to match your stack |

## Customizing

- Add stack-specific rules (e.g. `rules/nextjs.md`, `rules/python.md`) and `@`-import them in `CLAUDE.md`
- Adjust the `deploy.md` command if your build/check commands differ from `npm run typecheck/lint/build`
- The hook thresholds (20/40 tool calls) in `post-tool-use.sh` can be tuned up or down
