# /project:deploy

Run the full quality pipeline and update session notes. Do not declare the task done until all checks pass.

## Steps

1. **Typecheck** — run `npm run typecheck`. Fix all errors before continuing.
2. **Lint** — run `npm run lint`. Fix all errors and warnings before continuing.
3. **Build** — run `npm run build`. Fix any build errors before continuing.
4. **Update PROGRESS.md** — write a brief session summary under "Last Session", clear "In Progress" if the work is complete, and update "Up Next".

## Rules

- Fix errors in the order they are discovered. Do not skip ahead.
- If a fix in one step causes a failure in a previous step, restart from step 1.
- Only update PROGRESS.md after all checks pass.
