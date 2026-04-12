The user has a bug. Walk through this systematically:

1. **Reproduce**: Ask for or find the exact steps / input that trigger the bug.
2. **Isolate**: Narrow down to the smallest code path involved. Read the relevant files.
3. **Hypothesize**: State your best guess for root cause before changing anything.
4. **Fix**: Make the minimal change. Explain what you changed and why.
5. **Verify**: Run the relevant test or ask the user to confirm.
6. **Prevent**: If there's no test covering this, write one.

Do not shotgun-debug. One hypothesis at a time.
