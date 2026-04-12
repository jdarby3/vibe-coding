Spin up a new git worktree for parallel Claude work.

1. Ask the user: "What are you working on?" Use the answer to derive a branch name: lowercase, hyphens, no spaces (e.g. "add auth" → `add-auth`).
2. Get the repo root and name:
   ```
   REPO_ROOT=$(git rev-parse --show-toplevel)
   REPO_NAME=$(basename "$REPO_ROOT")
   ```
3. Create the worktree one level up from the repo root:
   ```
   git worktree add "$REPO_ROOT/../$REPO_NAME-[branch]" -b [branch]
   ```
4. Confirm it worked: run `git worktree list` and show the result.
5. Tell the user exactly what to do next:
   ```
   Open a new terminal and run:
     cd ../[repo-name]-[branch]
     claude
   ```
6. Remind them: when the feature is done, run `/worktree-merge` in that session — it will merge back to main, clean up, and let them close the terminal.
