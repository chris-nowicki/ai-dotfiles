#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/.rulesync"
TARGET_DIR="$HOME/.rulesync"

if [ -L "$TARGET_DIR" ]; then
  echo "Removing existing symlink at $TARGET_DIR"
  rm "$TARGET_DIR"
elif [ -e "$TARGET_DIR" ]; then
  echo "Error: $TARGET_DIR already exists and is not a symlink"
  echo "Please remove or backup it manually before running this script"
  exit 1
fi

ln -s "$SOURCE_DIR" "$TARGET_DIR"
echo "Created symlink: $TARGET_DIR -> $SOURCE_DIR"
