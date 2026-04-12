# Conventions

## Code Style
- Use consistent naming: camelCase for JS/TS, snake_case for Python.
- Prefer explicit over clever. Code is read more than written.
- No magic numbers. Use named constants.
- Keep functions under 40 lines. Extract when longer.

## Git
- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.
- One logical change per commit.
- Never commit secrets, env files, or node_modules.

## Files
- Group by feature, not by type.
- Co-locate tests next to the code they test.
- Keep imports sorted: stdlib → external → internal.

## Error Handling
- Never swallow errors silently.
- Use typed errors where the language supports it.
- Log context: what was attempted, what failed, with what input.
