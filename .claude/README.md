# .claude — Drop-in Claude Code Template

Paste this `.claude/` folder into any repo root, then:

```bash
chmod +x .claude/setup.sh && .claude/setup.sh
```

This symlinks `CLAUDE.md` and `.mcp.json` to the repo root (Claude Code expects them there). Everything else stays inside `.claude/`.

## What's inside

### Commands (slash commands in Claude Code)
| Command | What it does |
|---------|-------------|
| `/blueprint` | Map the codebase structure |
| `/debug` | Systematic bug investigation |
| `/deploy` | Pre-deploy checklist |
| `/handoff` | Write a session handoff note |

### Skills (reusable prompts Claude follows)
| Skill | What it does |
|-------|-------------|
| `grillme` | Stress-test an idea or PRD |
| `idea` | Shape a raw idea into something concrete |
| `prd` | Write a Product Requirements Doc |
| `prd-to-plan` | Convert PRD → ordered task list |
| `prd-to-issues` | Convert tasks → GitHub issues |
| `scaffold` | Generate initial project structure |
| `memory` | Maintain state across sessions |
| `parallel` | Find parallelizable work in the task list |

### Workflow
```
/idea → /prd → grillme → /prd-to-plan → /prd-to-issues → /scaffold → build
```

### Customize
- `rules/conventions.md` — your code style rules
- `rules/framework.md` — your stack and architecture patterns
- `mcp.json` — add MCP servers for external tools
- `hooks/` — add pre/post tool-use automation
