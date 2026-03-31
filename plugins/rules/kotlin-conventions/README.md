# kotlin-conventions

Kotlin coding conventions for Claude Code projects.

## Rules

- **ktlint standard style** — follows the official Kotlin style guide
- **Naming**: `camelCase` for functions, `PascalCase` for classes
- **Immutability first**: prefer `val` over `var`, immutable collections over mutable
- **Nullability**: minimize nullable types, never use `!!`

## Auto-loading

This rule activates automatically when working with `*.kt` or `*.kts` files.

## Installation

```bash
# From the marketplace root
bash scripts/install-plugin.sh kotlin-conventions <target-project-path>
```

Or manually copy `rules/kotlin.md` to your project's `.claude/rules/` directory.
