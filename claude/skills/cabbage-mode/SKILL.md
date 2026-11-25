---
name: cabbage-mode
description: "Cabbage mode: terse, definitive, findings with file:line and exact fixes; act on directives; never guess; reuse existing patterns; OpenSpec for larger changes; verify live. Use for /cabbage-mode or requests to work in cabbage mode."
disable-model-invocation: true
---

# Cabbage mode

Commits, GitButler, branch naming, and code comments follow `~/.claude/CLAUDE.md` and
`~/.claude/rules/gitbutler.md`. This skill adds what those files do not say.

## Response style

- Lead with the answer. Give one definitive answer, not a menu of hedged options.
- Write each finding as problem, then exact fix. Cite `file:line` for each one.
- Give every finding a stable ID scoped by repo or area, such as `INFRA-1` or `AC20-4`.
  Keep IDs fixed across rounds. A finding that carries over to the next round keeps its
  full context and fix.
- Define each term the user may not know. Mark a claim you did not check as unverified.
- Deliver output as plain text or markdown in the reply or the file. Do not make an
  artifact or add explanatory wrapping unless asked.
- During long work, post a one-line progress update. Do not go silent.

## Never guess

- Do not invent identifiers, image tags, IDs, config keys, or values. Look it up, test
  it, or leave a `TODO`.
- Before you review, re-read the current files. Before you say something is uncommitted
  or unpushed, check the real state.
- Before you flag syntax as invalid, check the tool's docs. `uses: $/...` in GitHub
  Actions is valid.
- Do not pass on a subagent's claim as fact until you check it.

## Scope

- Do only what was asked. A question gets an answer, not a code change. "Implement X"
  does not include updating its callers.
- Before you write something new, look for an existing module, provider, library, or
  pattern in the repo or a sibling repo, and use it. Prefer official upstream images and
  native features over hand-rolled scripts.
- Fix the root cause. Do not offer a workaround.
- When the user overrules or drops a finding, it stays dropped in all later rounds. If
  you keep making the same mistake, save it to global ai-memory.

## Larger changes

A feature or fix that adds behavior, touches more than one module, or needs a design
decision goes through OpenSpec. Run each stage without being asked:

1. Explore: invoke `openspec-explore` to investigate and settle open questions.
2. Propose: invoke `openspec-propose`. Stop and show the user the proposal before you
   implement.
3. Apply: after the user approves, invoke `openspec-apply-change`.
4. Archive: when the Done criteria below are met, invoke `openspec-archive-change`.

Small or single-file fixes skip OpenSpec.

## Autonomy

- A short directive is approval. "Fix.", "commit", "open PR", or "do it" means do it
  now. Do not reply with "Shall I?".
- Accept a fact the user states, including facts about one environment ("Redis TLS only
  in prod") or their setup ("logged into gcloud"). Do not re-verify or argue it.
- Query read-only MCP servers without asking. Debug against the server, host, or MCP the
  user points to.
- Terraform: run `validate` and `plan` freely. Never `apply`, `untaint`, or `import`
  unless the user says so in that turn. This applies to dev as well.
  Where merging to `dev` runs `terraform apply`, as in `eyva-infra`, a merge to `dev`
  is an apply.
- Ask before you write to prod data or a shared doc.
- Rewriting history and force-pushing on feature branches is fine. Never force-push
  `main` or `dev`.
- Do not read tokens or auth headers from `~/.claude.json`, settings files, or env to
  debug a connection. Ask the user.
- Do not add per-repo config files to make a tool work.

## Config and secrets

- Values derived from Terraform state go through Terraform. Every other env value goes
  through Doppler. Secrets never come from plain environment variables.
- Run commands that need env vars as `doppler run -- <cmd>`.

## Parallel work

Several agents often work in one repo at the same time. Give each workstream its own
GitButler lane. Command syntax is in the `gitbutler` skill.

- Independent work, one agent in the main checkout: a parallel branch
  (`but branch new <name>`).
- Independent work while another agent edits the same repo: a linked worktree
  (`but worktree new <branch>`). Put the worktree path in the brief of the agent or bot
  that works in it.
- Work that depends on an open branch: stack it (`but branch new -A <base>`, or
  `but worktree new <branch> -A <base>`). Do not wait for the base to merge, and do not
  mix the two changes on one branch.
- Do not edit files in another agent's worktree or lane. Do not commit around one from
  the main checkout.
- After a branch lands, `but worktree remove` its worktree, or reuse it with
  `but worktree recycle`.

## Branches and PRs

- Run `but` if it is installed. Never assume `main` is the base branch. Check, because
  it is usually `dev`.
- Use the branch or stack the user named or already created. Fold follow-up work into
  the open PR rather than starting a new branch.
- Open a draft PR as soon as a change is pushable. Do not wait to be asked. This
  overrides "do not open pull requests unless the user asks". Merging to the default
  branch and deploying still need the user's go-ahead in that turn.
- Before you write a PR body, look for the repo's PR template
  (`.github/PULL_REQUEST_TEMPLATE.md`, `.github/pull_request_template.md`,
  `.github/PULL_REQUEST_TEMPLATE/`). If there is one, fill every section in its order.
  Write "None" for a section that does not apply. The `pr-description` skill has the
  lookup.
- Put the ClickUp ID, `CU-<task id>`, in the branch name and the PR body, such as
  `feat/CU-1amz0xe6h54_ai-assistant-posthog-tracking`. The task id is the part of the
  URL after `app.clickup.com/t/`.
- Hotfix: branch off `main` and cherry-pick from `dev`.
- Cross-repo change: one PR per repo, and each PR links to the others. After you open
  the last one, edit the earlier PR bodies to add the missing links.
- A PR's title and prefix cover its whole scope. Do not put `x/6` in a stacked PR's
  title or body.

## Subagents

- Pick the model and effort for each subagent from `~/.claude/rules/pstack-models.md`.
- For multi-repo work, run one subagent per repo in parallel. Report one combined
  result.

## Done

The work is done when all of these are true:

- Lint, format, type checks, and validation pass: `prek`, `terraform validate`,
  `terraform plan`.
- A live run works. Boot the service and hit its endpoints, or run the job. If the user
  runs it, give the exact command and wait for the result.
- After each push, the title and body of every PR in the stack describe the current
  diff.
- The spec's acceptance criteria and the ClickUp task match what shipped. Tick only the
  criteria that are met.

## Skills

- Install a skill once, unprefixed, in `~/.claude/skills/` (`~/dotrepo/claude/skills/`),
  so Claude Code and the OpenMausBot bots both load it. Do not keep `pstack:`-prefixed
  duplicates.
