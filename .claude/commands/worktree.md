Spin up a new git worktree for parallel Claude work.

1. Ask the user: "What are you working on?" Use the answer to derive a branch name: lowercase, hyphens, no spaces (e.g. "add auth" → `add-auth`).

2. Check if the branch already exists:
   ```
   git branch --list [branch]
   ```
   If it does, ask the user for a different name before continuing.

3. Get the repo root and name:
   ```
   REPO_ROOT=$(git rev-parse --show-toplevel)
   REPO_NAME=$(basename "$REPO_ROOT")
   ```

4. Create the worktree one level up from the repo root:
   ```
   git worktree add "$REPO_ROOT/../$REPO_NAME-[branch]" -b [branch]
   ```

5. Confirm it worked: run `git worktree list` and show the result.

6. Tell the user exactly what to do next:
   ```
   Open a new terminal and run:
     cd ../[repo-name]-[branch]
     claude
   ```

7. Remind them: when the feature is done, run `/worktree-merge` in that session — it will merge back to main, clean up, and let them close the terminal.
