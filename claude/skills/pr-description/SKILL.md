---
name: pr-description
description: "Create or update GitHub pull request descriptions with the correct base branch. Use when creating a PR, opening a PR, updating a PR description, or writing a PR description. CRITICAL: Always detect the actual base branch before diffing — never assume `main`. The base branch is commonly `dev`, `development`, `staging`, or similar. Triggers on: create PR, open PR, update PR description, write PR description, make a PR, push and create PR."
---

# PR Description

## Step 1: Detect the base branch (MANDATORY — do this first, always)

Never assume `main`. Detect the real base branch before diffing or writing anything.

**If the PR already exists on GitHub:**
```bash
gh pr view --json baseRefName -q '.baseRefName'
```

**If the PR does not exist yet, check the remote default and available dev branches:**
```bash
# Check what the remote HEAD points to
git remote show origin | grep 'HEAD branch' | awk '{print $NF}'

# List remote branches to identify common dev branch names
git branch -r | grep -E 'origin/(dev|development|staging|main|master)$'
```

Use the result of these commands as `BASE_BRANCH`. Do not hardcode `main`.

## Step 2: Check for a PR template

Look for a PR template in the repo (in order of precedence):

```bash
find . -maxdepth 3 -type f \( \
  -path './.github/PULL_REQUEST_TEMPLATE.md' \
  -o -path './.github/PULL_REQUEST_TEMPLATE/*.md' \
  -o -path './docs/pull_request_template.md' \
  -o -name 'pull_request_template.md' \
\) 2>/dev/null | head -5
```

If a template is found, read it and use it as the body structure. If none is found, use the default template in Step 3.

## Step 3: Gather diff and commit history

Run these in parallel once `BASE_BRANCH` is confirmed:

```bash
git log origin/BASE_BRANCH..HEAD --oneline
git diff origin/BASE_BRANCH...HEAD
git branch --show-current
```

## Step 3: Create or update the PR

**Create a new PR:**
```bash
gh pr create --base BASE_BRANCH --title "..." --body "$(cat <<'EOF'
## Summary
- <bullet>

## Test plan
- [ ] <step>

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

**Update an existing PR:**
```bash
gh pr edit --body "$(cat <<'EOF'
## Summary
- <bullet>

## Test plan
- [ ] <step>

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

## Rules

- The `--base` flag must always reflect the detected base branch, not `main`.
- PR title: under 70 characters, imperative voice, describes what the branch does.
- Summary: 1–3 bullets on *what* changed and *why* — not a list of every file.
- Test plan: actionable checklist of steps to verify the change works correctly.
