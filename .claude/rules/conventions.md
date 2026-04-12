# Code Conventions

## Style
- Naming: camelCase for JS/TS, snake_case for Python.
- Prefer explicit over clever. No magic numbers — use named constants.
- Functions under 40 lines. Extract when longer.
- Imports sorted: stdlib → external → internal.
- Group by feature, not by type. Co-locate tests next to the code they test.

## Error Handling
- Never swallow errors silently.
- Use typed errors where the language supports it.
- Log context: what was attempted, what failed, with what input.

## Git
- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.
- One logical change per commit.
- Never commit secrets, env files, or node_modules.
