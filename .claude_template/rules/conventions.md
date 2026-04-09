# Conventions
<!--
  These are the default conventions for all projects using this template.
  Project-specific overrides go in CLAUDE.md under "Code Style and Conventions".
  Rules in CLAUDE.md always take precedence over this file.
-->

---

## File Naming

| Thing              | Convention             | Example                      |
|--------------------|------------------------|------------------------------|
| Components         | PascalCase             | `UserCard.tsx`               |
| Hooks              | `use` + CamelCase      | `useInvoiceData.ts`          |
| Utilities          | camelCase              | `formatCurrency.ts`          |
| Constants          | SCREAMING_SNAKE_CASE   | `MAX_UPLOAD_SIZE_MB`         |
| Types / interfaces | PascalCase             | `InvoiceStatus.ts`           |
| Directories        | kebab-case             | `components/invoice-list/`   |
| Test files         | Same name + `.test`    | `UserCard.test.tsx`          |
| Server actions     | camelCase + `Action`   | `createInvoiceAction.ts`     |

---

## Component Structure

Prefer this internal order for component files:

```tsx
// 1. Imports (external libraries first, then internal)
import { useState } from 'react'
import { formatDate } from '@/lib/formatDate'

// 2. Types / interfaces local to this file
type Props = { ... }

// 3. Constants local to this file
const MAX_ITEMS = 10

// 4. The component itself
export function MyComponent({ prop }: Props) {
  // a. Hooks
  // b. Derived values / computed state
  // c. Handlers
  // d. Early returns (loading, error states)
  // e. Main render
}

// 5. Helper sub-components (only if tightly coupled to this component)
```

---

## Code Style

- **Functional components only** — no class components.
- **Named exports** for all components; default exports for pages and layouts only.
- **No inline styles** — use Tailwind classes (or the project's chosen styling system).
- **`async/await`** over `.then()` chains.
- **`const` over `let`**; never `var`.
- **No `any` types** — use `unknown` and narrow, or define a proper type.
- **No `console.log`** in committed code — use a proper logger or remove before committing.
- **No commented-out code** left in files — delete it or put it in a note.

---

## Commit Message Format

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short summary in present tense>

[optional body: what and why, not how]
[optional footer: breaking changes, issue refs]
```

**Types:**

| Type       | When to use                                               |
|------------|-----------------------------------------------------------|
| `feat`     | A new feature visible to the user                         |
| `fix`      | A bug fix                                                 |
| `refactor` | Code change that isn't a fix or feature                   |
| `chore`    | Tooling, config, dependency updates                       |
| `docs`     | Documentation only                                        |
| `test`     | Adding or fixing tests                                    |
| `style`    | Formatting, whitespace — no logic change                  |

**Examples:**
```
feat(invoices): add PDF export for individual invoices
fix(auth): redirect to login when session expires silently
chore: upgrade Prisma to 5.14
```

---

## Import Order

1. Node built-ins (e.g. `path`, `fs`)
2. External packages (e.g. `react`, `next`, `zod`)
3. Internal absolute imports (e.g. `@/lib/...`, `@/components/...`)
4. Relative imports (e.g. `./utils`, `../types`)

Separate each group with a blank line.

---

## Never Do

- No `any` types — if you don't know the type, use `unknown` and narrow it.
- No `console.log` in production code.
- No commented-out code blocks.
- **Never delete files** — move to `_archive/` if they need to be removed.
- **Never install a new dependency** without naming it and waiting for confirmation.
- **Never run destructive operations** (migrations, drops, resets) without explicit approval.

---

## Project-Specific Overrides

Any rule here can be overridden in `CLAUDE.md`. When a conflict exists, **CLAUDE.md wins**.
