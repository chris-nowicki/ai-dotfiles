#!/usr/bin/env bash
set -e

npx rulesync generate \
  --targets cursor,opencode \
  --features commands,rules,subagents,skills \
  --delete

stow -t ~ out
