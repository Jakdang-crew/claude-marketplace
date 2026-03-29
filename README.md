# Claude Code Marketplace

A personal marketplace for managing Claude Code plugins as modular, reusable components.

## What is this?

This repository organizes Claude Code extensibility artifacts — **agents**, **skills**, **hooks**, and **rules** — into a standardized plugin format. Each plugin is self-contained and can be independently loaded into any Claude Code session.

## Repository Structure

```
claude-code-marketplace/
├── marketplace.json              # Plugin index
├── plugins/
│   ├── agents/                   # Custom subagents
│   ├── skills/                   # Slash commands
│   ├── hooks/                    # Event-driven automations
│   ├── rules/                    # Coding rules & conventions
│   └── bundles/                  # Multi-category packages
└── docs/
    ├── plugin-spec.md            # Plugin format specification
    └── adr/                      # Architecture Decision Records
```

## Quick Start

### Using a plugin

```bash
# Load a plugin into your Claude Code session
claude --plugin-dir ./plugins/skills/my-skill

# Or reference from another project
claude --plugin-dir /path/to/claude-code-marketplace/plugins/agents/my-agent
```

### Creating a plugin

1. Pick a category (`agents`, `skills`, `hooks`, `rules`, or `bundles`)
2. Create a directory under `plugins/<category>/<plugin-name>/`
3. Add `.claude-plugin/plugin.json` manifest
4. Add capability files (see [Plugin Spec](docs/plugin-spec.md))
5. Register in `marketplace.json`

## Plugin Format

Every plugin follows the [Plugin Specification](docs/plugin-spec.md). Minimal example:

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   └── my-skill/
│       └── SKILL.md
└── README.md
```

## Documentation

- [Plugin Specification](docs/plugin-spec.md) — Format, fields, and examples
- [Contributing Guide](CONTRIBUTING.md) — How to add new plugins
- [ADR](docs/adr/) — Architecture decisions

## License

MIT
