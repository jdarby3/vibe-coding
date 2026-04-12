Self-review before committing. Run this before every commit.

1. Run `git diff --cached` (or `git diff` if nothing staged) to see all changes.
2. Spawn the **reviewer** agent with the diff. Have it check for bugs, style violations, and missing tests.
3. If the reviewer returns **FAIL**: fix the flagged issues, then re-run `/review`.
4. If **PASS** or **PASS WITH NOTES**: summarise the changes to the user and ask for commit confirmation.
5. On confirmation: commit with a conventional commit message.
