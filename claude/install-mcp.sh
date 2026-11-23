#!/usr/bin/env bash
# Renders claude/mcp.json with secrets from Infisical and merges its servers into ~/.claude.json.
set -euo pipefail

template="$(cd "$(dirname "$0")" && pwd)/mcp.json"
target="$HOME/.claude.json"
[ -f "$target" ] || echo '{}' >"$target"
tmp="$(mktemp "$target.XXXXXX")"
trap 'rm -f "$tmp"' EXIT

infisical run --silent \
  -- jq --slurpfile t "$template" '
    .mcpServers = (.mcpServers // {}) + ($t[0].mcpServers | walk(
      if type == "string" then
        gsub("\\$\\{(?<v>[A-Za-z_][A-Za-z0-9_]*)\\}"; $ENV[.v] // error("missing secret: \(.v)"))
      else . end
    ))' "$target" >"$tmp"

chmod 600 "$tmp"
mv "$tmp" "$target"
