# pstack skills in Claude Code

pstack is linked in as user skills (`~/.claude/skills/<name>`) and agents
(`poteto-agent`, `comment-sicko`), not as a plugin. Most of its skills set
`disable-model-invocation: true`, so the `Skill` tool refuses them and they are missing
from the skill catalog. That does not mean pstack is absent.

- `<pstack>` =
  `~/.claude/plugins/marketplaces/cursor-plugins/harness/pstack/claude-code/`.
- To run or apply a pstack skill (`/poteto-mode`, `arena`, `interrogate`, any
  `principle-*`, ...): `Read` `~/.claude/skills/<name>/SKILL.md` and follow it.
- Before following one, `Read` `<pstack>/docs/harness/claude-code.md` once and map
  Cursor names with it (`Task` → `Agent`, `~/.cursor/plugins/` → `~/.claude/plugins/`,
  model slugs → `model`/`effort`). Ignore its `pstack:` prefixes: commands are `/<name>`
  and agents are `poteto-agent` / `comment-sicko`.
- When spawning a subagent that must follow a pstack skill, put the absolute `SKILL.md`
  path in its brief.
