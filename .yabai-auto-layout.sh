#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

EXTERNAL_WIDTH_THRESHOLD=2400

if ! command -v yabai >/dev/null 2>&1 || ! command -v jq >/dev/null 2>&1; then
  exit 0
fi

if ! displays_json="$(yabai -m query --displays 2>/dev/null)"; then
  # yabai may briefly be unavailable during restarts/hotplug changes.
  exit 0
fi

display_count="$(jq 'length' <<<"$displays_json")"
max_display_width="$(jq -r '[.[].frame.w] | max // 0 | floor' <<<"$displays_json")"

if [ "$display_count" -gt 1 ] || [ "$max_display_width" -ge "$EXTERNAL_WIDTH_THRESHOLD" ]; then
  layout="bsp"
else
  layout="stack"
fi

yabai -m config layout "$layout"
yabai -m query --spaces | jq -r '.[].index' | while read -r space; do
  yabai -m space "$space" --layout "$layout"
done
