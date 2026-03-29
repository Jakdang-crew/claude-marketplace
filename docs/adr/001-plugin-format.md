# ADR-001: Plugin Format

## Status

Accepted

## Context

We need a standard format for managing Claude Code extensibility artifacts (agents, skills, hooks, rules) as reusable, composable modules.

## Decision

Adopt the official Claude Code plugin format (`.claude-plugin/plugin.json` manifest) as the standard. Each plugin is self-contained in its own directory with a manifest and capability-specific subdirectories.

Plugins are organized by primary category (`agents/`, `skills/`, `hooks/`, `rules/`) with `bundles/` for multi-category packages.

## Rationale

- **Official compatibility**: Follows Claude Code's native plugin discovery and loading mechanism.
- **Self-contained**: Each plugin directory can be independently loaded via `--plugin-dir`.
- **Composable**: Bundles allow combining multiple capabilities into a single installable unit.
- **Versionable**: Semver in `plugin.json` enables tracking changes per plugin.

## Consequences

- Every new tool (agent, skill, hook, rule) must be wrapped in the plugin format before registration.
- The marketplace index (`marketplace.json`) must be updated when plugins are added or modified.
