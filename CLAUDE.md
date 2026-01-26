# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AI Dotfiles — a centralized configuration management system for AI coding assistants. It uses [rulesync](https://github.com/dyoshikawa/rulesync) to maintain a single source of truth in `.rulesync/` and generate tool-specific configs for Cursor, Claude Code, OpenCode, and others.

This is a configuration-only repository (no package.json, no build system, no tests).

## Key Commands

```bash
# Initial setup — creates symlink from ~/.rulesync -> repo's .rulesync/
./setup.sh

# After editing any files in .rulesync/, regenerate configs in a target project
cd /path/to/your/project
rulesync generate -g
```

## Architecture

### How It Works

1. `.rulesync/` is the source of truth for all AI tool configurations
2. `setup.sh` symlinks `.rulesync/` to `~/.rulesync` for global access
3. Running `rulesync generate -g` in any project reads from `~/.rulesync` and generates tool-specific config files (`.cursor/`, `CLAUDE.md`, `AGENTS.md`, etc.)
4. `rulesync.jsonc` controls which AI tools (`targets`) and config types (`features`) are generated

### .rulesync/ Directory

| Path | Purpose |
|------|---------|
| `rules/` | Coding guidelines distributed to AI tools. Frontmatter `root: true` means it applies globally. |
| `commands/` | Custom slash commands (e.g., `/commit`, `/create-pr`). Each `.md` file becomes a command. |
| `subagents/` | Specialized AI agent definitions (e.g., `planner.md` — read-only analysis agent). |
| `skills/` | Reusable instruction sets. Each skill is a directory containing a `SKILL.md`. |
| `mcp.json` | MCP server configurations (currently Serena and Context7). |
| `.aiignore` | Patterns for files AI tools should ignore (like `.gitignore` for AI). |

### Configuration Files

- **`rulesync.jsonc`** — Main config. `targets` array sets which AI tools receive configs; `features` array controls what types of configs are generated; `delete: true` cleans up stale generated files.
- **Frontmatter in `.md` files** — Each config file has YAML frontmatter with a `targets` field. Use `["*"]` for all tools or specify specific targets like `["cursor", "claudecode"]`.

### External Dependencies

- `rulesync` (npm package) — config generation engine
- `uvx` — runs Serena MCP server
- `npx` — runs Context7 MCP server
- `gh` (GitHub CLI) — used by `/create-pr` command
