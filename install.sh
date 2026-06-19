#!/usr/bin/env bash
# Install the Rosé Pine Moon theme for hunk.
#
# hunk reads its config from $XDG_CONFIG_HOME/hunk/config.toml
# (falling back to ~/.config/hunk/config.toml). This script writes the
# theme there. Because TOML can only contain one top-level `theme` key and
# one [custom_theme] table, this installer will NOT blindly append to an
# existing config — if you already have one, it backs it up first and tells
# you what to do.

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/rose-pine-moon.toml"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hunk"
CONFIG="$CONFIG_DIR/config.toml"

mkdir -p "$CONFIG_DIR"

if [[ ! -f "$SRC" ]]; then
  echo "error: rose-pine-moon.toml not found next to this script" >&2
  exit 1
fi

if [[ -f "$CONFIG" ]]; then
  if grep -q 'label *= *"Rosé Pine Moon"' "$CONFIG"; then
    echo "Rosé Pine Moon already installed in $CONFIG — nothing to do."
    exit 0
  fi
  backup="$CONFIG.bak.$(date +%Y%m%d%H%M%S)"
  cp "$CONFIG" "$backup"
  echo "You already have a hunk config at:"
  echo "  $CONFIG"
  echo "Backed it up to:"
  echo "  $backup"
  echo
  echo "This installer won't overwrite it automatically, because your config"
  echo "may set other options (mode, line_numbers, etc.)."
  echo
  echo "To install, do ONE of:"
  echo "  1. Replace it:   cp \"$SRC\" \"$CONFIG\""
  echo "  2. Merge by hand: open both files and copy the"
  echo "     theme = \"custom\" line and the [custom_theme] tables into your config,"
  echo "     replacing any existing theme/[custom_theme] you already have."
  exit 0
fi

cp "$SRC" "$CONFIG"
echo "Installed Rosé Pine Moon to $CONFIG"
echo
echo "If a hunk session is open in an editor/agent, reload it with:"
echo "  hunk session reload --repo . -- diff"
echo "Otherwise just run 'hunk diff' or 'hunk show' — it's already active."
echo "Pick it any time from the in-app theme menu as \"Rosé Pine Moon\"."
