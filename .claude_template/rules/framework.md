# Framework Rules
<!--
  REPLACE THIS FILE with rules specific to your framework and project.
  The examples below are starting points — uncomment or copy the section that matches your stack,
  then delete the rest and add your own project-specific rules.

  This file is read by Claude on every session via CLAUDE.md's @.claude/rules/framework.md reference.
  Rules here apply to ALL tasks in this project.
-->

---

## ⬇ Replace everything below with your stack's rules ⬇

---

<!-- ============================================================
     EXAMPLE: Next.js App Router
     ============================================================ -->

## App Router (Next.js)

- Always use the App Router (`app/` directory). Never use `pages/`.
- **Server Components are the default.** Do not add `'use client'` unless the component requires browser APIs, event handlers, or React state/effects.
- Keep Client Components as leaf nodes in the component tree — push interactivity as far down as possible.
- Use `loading.tsx` for loading states at route segments that fetch async data.
- Use `error.tsx` for error boundaries at route segments that can fail.
- Use `layout.tsx` for shared UI wrapping multiple pages.
- Server Actions go in `app/actions/` — never define them inline in page files.
- Use `next/image` for all images, `next/link` for all internal links.

<!-- ============================================================
     EXAMPLE: React Native (Expo)
     ============================================================ -->

<!--
## React Native (Expo)

- Use Expo Router for file-based navigation — keep all screens in `app/`.
- Use `StyleSheet.create()` or NativeWind for styling — no inline style objects.
- Separate business logic into hooks — screen files should be mostly JSX.
- Always test on both iOS and Android simulators before marking a task done.
- Use `expo-secure-store` for sensitive values, never `AsyncStorage`.
-->

<!-- ============================================================
     EXAMPLE: FastAPI (Python)
     ============================================================ -->

<!--
## FastAPI

- One router file per domain (e.g. `routers/invoices.py`) — never define routes in `main.py`.
- Use Pydantic models for all request and response schemas — no raw `dict` in/out.
- Dependency injection via `Depends()` for DB sessions, auth, and shared services.
- All database access goes through a repository layer — no raw queries in route handlers.
- Use `httpx.AsyncClient` in tests — never `requests`.
-->

<!-- ============================================================
     EXAMPLE: SvelteKit
     ============================================================ -->

<!--
## SvelteKit

- Use server-side `load()` functions for data fetching — avoid client-side fetch in `onMount`.
- Form actions over client-side fetch wherever possible.
- `$lib` alias for all internal imports.
- Keep stores minimal — prefer derived state from `$page` and `load()` data.
-->

---

## Before Declaring Any Task Done

Regardless of framework, always run the following before marking a task complete:

```bash
# Type-check
npm run typecheck   # or: tsc --noEmit | pyright | mypy

# Lint
npm run lint        # or: eslint | ruff | flake8

# Tests
npm test
```

All three must pass with no errors. Fix issues before finishing.
