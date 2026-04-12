When tackling a large task list, identify which tasks can be done in parallel vs. which are sequential.

1. Read `.claude/state/tasks.md`.
2. Build a dependency graph.
3. Identify the **critical path** (longest sequential chain).
4. Group independent tasks into parallel batches.
5. Present the plan:
   ```
   Batch 1 (parallel): Task A, Task B, Task C
   Batch 2 (after Batch 1): Task D (depends on A), Task E (depends on B)
   Batch 3 (after Batch 2): Task F (depends on D+E)
   ```
6. Suggest which batch to start with and why.

This is useful for planning work across multiple Claude Code sessions or multiple developers.
