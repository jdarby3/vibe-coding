Run the project's test suite.

1. **Find the test runner**: check for jest/vitest/pytest/go test/cargo test config files.
2. **Run the full suite**. Report clearly: X passed, Y failed, Z skipped.
3. **For any failures**: read the failing test and the implementation. Diagnose the root cause. Fix it. Re-run to confirm.
4. **If no tests exist**: ask the user if they want to start with tests for the most critical module, then spawn the test-writer agent to write them.

Do not mark a task complete if tests are failing.
