# /project:debug

Focused debugging workflow. Do not refactor surrounding code — apply the minimal fix required.

## Steps

1. **Reproduce** — confirm the exact error message, location, and conditions that trigger it.
2. **Trace** — follow the call path to identify the root cause. State what it is before touching any code.
3. **Scope** — define the minimal change needed to fix the root cause. Do not touch unrelated code.
4. **Apply** — make the fix.
5. **Verify** — run `npm run typecheck` and `npm run lint`. Confirm both pass.

## Output

At the end, write three lines:

- **Root cause:** what was wrong
- **Fix applied:** what was changed
- **Verified:** typecheck and lint result
