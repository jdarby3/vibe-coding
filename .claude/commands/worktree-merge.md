Merge this worktree's branch back to main and clean up. Run this from inside a feature worktree session when the work is done.

1. **Verify we're in a worktree** (not on main):
   ```
   git worktree list
   git branch --show-current
   ```
   If already on main, stop and tell the user — there's nothing to merge.

2. **Capture context**:
   ```
   FEATURE_BRANCH=$(git branch --show-current)
   FEATURE_PATH=$(git rev-parse --show-toplevel)
   MAIN_PATH=$(git worktree list | head -1 | awk '{print $1}')
   ```

3. **Commit any uncommitted work** — if there are unstaged or staged changes, commit them now with a conventional commit message before proceeding.

4. **Run tests** — check whether a test suite exists (jest/vitest/pytest/go test/cargo test config). If one exists, run it. If tests fail, fix them before continuing. If no test suite exists, skip this step and continue.

5. **Review the diff** — spawn the reviewer agent against the full diff vs main:
   ```
   git diff main...HEAD
   ```
   If the reviewer returns FAIL, fix the issues and re-review. Continue only on PASS or PASS WITH NOTES.

6. **Merge into main** — run the merge from the main worktree using `-C` so we don't need to change directories:
   ```
   git -C "$MAIN_PATH" merge "$FEATURE_BRANCH" --no-ff -m "feat: merge $FEATURE_BRANCH"
   ```
   If there are merge conflicts, resolve them, then complete the merge.

7. **Push**:
   ```
   git -C "$MAIN_PATH" push
   ```

8. **Clean up**:
   ```
   git worktree remove "$FEATURE_PATH"
   git -C "$MAIN_PATH" branch -d "$FEATURE_BRANCH"
   ```

9. Tell the user the merge is complete, the worktree has been removed, and they can close this terminal.
