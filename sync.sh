#!/usr/bin/env bash
set -e

npx rulesync generate

stow -t ~ out
