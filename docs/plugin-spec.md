# Plugin Specification

## Overview

Every plugin in this marketplace follows the Claude Code plugin format. A plugin is a directory containing a `.claude-plugin/plugin.json` manifest and one or more capability directories.

## Directory Structure

```
<plugin-name>/
├── .claude-plugin/
│   └── plugin.json           # Manifest (required)
├── agents/                   # Agent definitions (.md)
├── skills/
│   └── <skill-name>/
│       └── SKILL.md          # Skill definitions
├── hooks/
│   └── hooks.json            # Hook configurations
├── rules/                    # Rule files (.md)
├── .mcp.json                 # MCP server configs (optional)
└── README.md                 # Documentation (required)
```

## Manifest (`plugin.json`)

```json
{
  "name": "my-plugin",
  "description": "What this plugin does",
  "version": "1.0.0",
  "category": "skills",
  "tags": ["kotlin", "testing"],
  "author": {
    "name": "Author Name",
    "url": "https://github.com/author"
  },
  "license": "MIT"
}
```

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Unique identifier (lowercase, hyphens) |
| `description` | string | One-line summary |
| `version` | string | Semver format |
| `category` | string | One of: `agents`, `skills`, `hooks`, `rules`, `bundles` |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `tags` | string[] | Searchable keywords |
| `author` | object | `name`, `url` |
| `license` | string | License identifier |

## Categories

| Category | Purpose | Key File |
|----------|---------|----------|
| `agents` | Custom subagents with specialized roles | `agents/<name>.md` |
| `skills` | Slash commands with structured prompts | `skills/<name>/SKILL.md` |
| `hooks` | Event-driven automations | `hooks/hooks.json` |
| `rules` | Context-aware coding rules | `rules/<name>.md` |
| `bundles` | Multi-category plugin packages | Mixed |

## Agent Definition Format

```yaml
---
name: agent-name
description: When to use this agent
tools: Read, Grep, Glob, Bash
model: sonnet
maxTurns: 20
---

Agent system prompt here...
```

## Skill Definition Format

```yaml
---
name: skill-name
description: What this skill does
argument-hint: "[argument]"
allowed-tools: Read, Grep, Glob
---

Skill instructions here...
```

## Hook Configuration Format

```json
{
  "PreToolUse": [
    {
      "matcher": "Bash",
      "hooks": [
        {
          "type": "command",
          "command": "./scripts/validate.sh"
        }
      ]
    }
  ]
}
```

## Rule File Format

```yaml
---
paths:
  - "src/**/*.kt"
---

# Rule Title

- Rule content here
```

## Installation

To use a plugin from this marketplace, load it with:

```bash
claude --plugin-dir ./plugins/<category>/<plugin-name>
```

Or add to your project's plugin configuration.
