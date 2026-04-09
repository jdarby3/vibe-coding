# Conventions

## File Structure

```
src/                  # Application source
components/ui/        # Generic, reusable UI primitives
components/features/  # Domain-specific feature components
lib/                  # Shared utilities and helpers
hooks/                # Custom React hooks
types/                # TypeScript type definitions
```

## Naming

| Thing | Convention | Example |
|---|---|---|
| Components | PascalCase | `UserCard.tsx` |
| Hooks | useCamelCase | `useData.ts` |
| Utilities | camelCase | `formatDate.ts` |
| Constants | SCREAMING_SNAKE_CASE | `MAX_ITEMS` |
| Directories | kebab-case | `components/user-card/` |

## Code Style

- Functional components only — no class components.
- Named exports for all components; default exports for pages/layouts only.
- No inline styles — use Tailwind classes exclusively.
- `async/await` over `.then()` chains.
- `const` over `let`; never `var`.

## Never Do

- No `any` types — use `unknown` and narrow, or define a proper type.
- No `console.log` in production code.
- No commented-out code blocks left in files.
- Never delete files — move them to `_archive/` instead.
- Never install a new dependency without mentioning it explicitly before doing so.
