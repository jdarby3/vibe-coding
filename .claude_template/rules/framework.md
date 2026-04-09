# Framework Rules

<!-- Replace this file's content with rules specific to your framework. -->
<!-- Examples below are for Next.js App Router. Swap out as needed. -->

## App Router (Next.js example)

- Always use the App Router (`app/` directory). No `pages/` directory.
- Server Components are the default — do not add `'use client'` unless the component requires browser APIs, event handlers, or React state/effects.
- Keep Client Components as leaf nodes in the component tree.

## File Conventions

- Use `loading.tsx` for loading states at route segments where async data is fetched.
- Use `error.tsx` for error boundaries at route segments that can fail.
- Use `layout.tsx` for shared UI that wraps multiple pages.

## Before Declaring Done

Always run both of the following before marking any task complete:

```bash
npm run typecheck
npm run lint
```

Both must pass with no errors. Fix issues before finishing.
