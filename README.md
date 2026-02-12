# AI Dotfiles

Centralized AI coding assistant configs. Write once, sync everywhere.

Uses [rulesync](https://github.com/dyoshikawa/rulesync) to generate tool-specific configs for Cursor, Claude Code, GitHub Copilot, OpenCode, and more from a single source of truth.

## Setup

```bash
# 1. Install rulesync
npm install -g rulesync

# 2. Clone and set up
git clone <repository-url>
cd ai-dotfiles
make setup
```

That's it. The setup script symlinks `~/.rulesync` to this repo and runs the first sync.

## Usage

After editing any config files, sync your changes:

```bash
make sync
```

Other commands:

```bash
make dry-run   # Preview what will be generated
make check     # Verify generated files haven't drifted
```

## What's Inside

All configs live in `.rulesync/`:

| Path | Purpose |
|------|---------|
| `rules/` | Coding guidelines — style, TypeScript, architecture |
| `commands/` | Slash commands (`/commit`, `/create-pr`) |
| `subagents/` | Specialized agents (planner) |
| `skills/` | Reusable skill sets (find-skills, frontend-design) |
| `.aiignore` | Files to hide from AI tools |

## Adding Configs

Create a `.md` file in the appropriate directory. Each file needs frontmatter:

```markdown
---
root: true
targets: ["*"]
description: "What this config does"
globs: ["**/*"]
---

Your instructions here.
```

- `targets: ["*"]` sends to all AI tools
- `targets: ["cursor", "claudecode"]` sends to specific tools only
- `globs` controls which files the rule applies to

Then run `make sync`.

## Repo Structure

```
ai-dotfiles/
├── .rulesync/           # Source of truth (edit these)
│   ├── rules/           # code-style.md (style, TS, architecture)
│   ├── commands/        # commit, create-pr
│   ├── subagents/       # planner
│   ├── skills/          # find-skills, frontend-design
│   └── .aiignore
├── rulesync.jsonc        # Rulesync config (targets, features)
├── setup.sh              # One-time setup (symlink + first sync)
├── Makefile              # sync, check, dry-run, setup
└── README.md
```

## Learn More

- [rulesync documentation](https://github.com/dyoshikawa/rulesync)
- [Skills ecosystem](https://skills.sh/)
