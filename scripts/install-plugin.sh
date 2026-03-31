#!/usr/bin/env bash
set -euo pipefail

# Usage: bash scripts/install-plugin.sh <plugin-name> <target-project-path>
# Example: bash scripts/install-plugin.sh kotlin-conventions /path/to/my-project

MARKETPLACE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN_NAME="${1:?Usage: install-plugin.sh <plugin-name> <target-project-path>}"
TARGET="${2:?Usage: install-plugin.sh <plugin-name> <target-project-path>}"

# Find plugin directory
PLUGIN_DIR=$(find "$MARKETPLACE_ROOT/plugins" -type d -name "$PLUGIN_NAME" | head -1)

if [[ -z "$PLUGIN_DIR" ]]; then
  echo "Error: plugin '$PLUGIN_NAME' not found"
  exit 1
fi

echo "Installing '$PLUGIN_NAME' → $TARGET"

# Copy each capability directory
for dir in agents skills hooks rules; do
  if [[ -d "$PLUGIN_DIR/$dir" ]]; then
    mkdir -p "$TARGET/.claude/$dir"
    cp -r "$PLUGIN_DIR/$dir/"* "$TARGET/.claude/$dir/"
    echo "  ✓ $dir"
  fi
done

# Copy MCP config if exists
if [[ -f "$PLUGIN_DIR/.mcp.json" ]]; then
  cp "$PLUGIN_DIR/.mcp.json" "$TARGET/.mcp.json"
  echo "  ✓ .mcp.json"
fi

echo "Done."
