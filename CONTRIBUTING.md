# Contributing

## Adding a New Plugin

1. Create a directory under the appropriate category in `plugins/`:

   ```
   plugins/<category>/<plugin-name>/
   ```

2. Add the manifest at `.claude-plugin/plugin.json` (see [Plugin Spec](docs/plugin-spec.md)).

3. Add the capability files (agent `.md`, skill `SKILL.md`, hook `hooks.json`, or rule `.md`).

4. Add a `README.md` describing what the plugin does, when to use it, and usage examples.

5. Register the plugin in `marketplace.json` at the repository root.

## Plugin Naming

- Use lowercase with hyphens: `kotlin-test-runner`, `pr-review-agent`
- Be descriptive but concise
- Prefix with domain if needed: `spring-api-rules`

## Commit Convention

```
feat(plugins): add <plugin-name> <category> plugin
fix(plugins): fix <issue> in <plugin-name>
docs: update <document>
```
