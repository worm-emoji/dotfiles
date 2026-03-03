#!/usr/bin/env bash

set -euo pipefail

APP_NAME="Obsidian"
STATE_FILE="/tmp/yabai-obsidian-popover.id"
MAX_WIDTH=1400
MAX_HEIGHT=960
WIDTH_RATIO=75
HEIGHT_RATIO=82

hide_popover() {
  local popover_id=""

  if [ -f "$STATE_FILE" ]; then
    popover_id="$(cat "$STATE_FILE" 2>/dev/null || true)"
  fi

  # Minimize only the tracked popover window so other Obsidian windows are unaffected.
  if [ -n "$popover_id" ]; then
    yabai -m window "$popover_id" --minimize >/dev/null 2>&1 || true
  fi

  rm -f "$STATE_FILE"
}

float_window_if_obsidian() {
  local window_id="${YABAI_WINDOW_ID:-}"
  local app_name=""
  local is_floating=""

  [ -n "$window_id" ] || return 0
  window_exists "$window_id" || return 0

  app_name="$(yabai -m query --windows --window "$window_id" | jq -r '.app // empty')"
  [ "$app_name" = "$APP_NAME" ] || return 0

  is_floating="$(yabai -m query --windows --window "$window_id" | jq -r '."is-floating" // false')"
  if [ "$is_floating" != "true" ]; then
    yabai -m window "$window_id" --toggle float >/dev/null 2>&1 || true
  fi
}

window_exists() {
  local window_id="${1:-}"

  [ -n "$window_id" ] || return 1
  yabai -m query --windows --window "$window_id" >/dev/null 2>&1
}

is_obsidian_window() {
  local window_id="${1:-}"

  [ -n "$window_id" ] || return 1

  yabai -m query --windows --window "$window_id" \
    | jq -e --arg app "$APP_NAME" '.app == $app' >/dev/null 2>&1
}

current_window_id() {
  yabai -m query --windows --window 2>/dev/null | jq -r '.id // empty'
}

pick_obsidian_window() {
  local current_space
  local pick=""

  current_space="$(yabai -m query --spaces --space | jq -r '.index')"

  # Prefer an existing Obsidian window on the current space.
  pick="$(yabai -m query --windows \
    | jq -r --arg app "$APP_NAME" --argjson space "$current_space" '
      map(select(.app == $app and .["is-visible"] == true and .["is-minimized"] == false and .space == $space))
      | .[0].id // empty
    ')"

  if [ -n "$pick" ]; then
    echo "$pick"
    return
  fi

  # Fallback to any non-minimized Obsidian window.
  yabai -m query --windows \
    | jq -r --arg app "$APP_NAME" '
      map(select(.app == $app and .["is-minimized"] == false))
      | .[0].id // empty
    '
}

center_and_resize() {
  local window_id="$1"
  local display_id display_dims
  local display_x display_y display_w display_h
  local window_dims window_x window_y window_w window_h
  local width height target_x target_y dx dy

  display_id="$(yabai -m query --windows --window "$window_id" | jq -r '.display')"
  display_dims="$(yabai -m query --displays --display "$display_id" | jq -r '.frame | "\(.x|floor) \(.y|floor) \(.w|floor) \(.h|floor)"')"

  read -r display_x display_y display_w display_h <<<"$display_dims"

  width=$((display_w * WIDTH_RATIO / 100))
  height=$((display_h * HEIGHT_RATIO / 100))

  if [ "$width" -gt "$MAX_WIDTH" ]; then
    width="$MAX_WIDTH"
  fi

  if [ "$height" -gt "$MAX_HEIGHT" ]; then
    height="$MAX_HEIGHT"
  fi

  yabai -m window "$window_id" --resize abs:"$width":"$height"
  sleep 0.05

  window_dims="$(yabai -m query --windows --window "$window_id" | jq -r '.frame | "\(.x|floor) \(.y|floor) \(.w|floor) \(.h|floor)"')"
  read -r window_x window_y window_w window_h <<<"$window_dims"

  target_x=$((display_x + (display_w - window_w) / 2))
  target_y=$((display_y + (display_h - window_h) / 2))
  dx=$((target_x - window_x))
  dy=$((target_y - window_y))

  yabai -m window "$window_id" --move rel:"$dx":"$dy"
}

ensure_floating() {
  local window_id="$1"
  local is_floating

  is_floating="$(yabai -m query --windows --window "$window_id" | jq -r '."is-floating"')"

  if [ "$is_floating" != "true" ]; then
    yabai -m window "$window_id" --toggle float
  fi
}

show_popover() {
  local window_id current_space attempt

  open -a "$APP_NAME" >/dev/null 2>&1 || true
  sleep 0.12

  window_id=""
  for attempt in 1 2 3 4 5; do
    window_id="$(pick_obsidian_window)"
    [ -n "$window_id" ] && break
    sleep 0.12
  done

  if [ -z "$window_id" ]; then
    exit 1
  fi

  current_space="$(yabai -m query --spaces --space | jq -r '.index')"

  # Make sure the popover appears where the user is currently working.
  yabai -m window "$window_id" --deminimize >/dev/null 2>&1 || true
  yabai -m window "$window_id" --space "$current_space"
  yabai -m window "$window_id" --focus
  ensure_floating "$window_id"
  center_and_resize "$window_id"
  yabai -m window "$window_id" --focus

  echo "$window_id" > "$STATE_FILE"
}

toggle() {
  local tracked_id focused_id

  tracked_id=""
  if [ -f "$STATE_FILE" ]; then
    tracked_id="$(cat "$STATE_FILE" 2>/dev/null || true)"
  fi

  focused_id="$(current_window_id)"

  if [ -n "$tracked_id" ] && window_exists "$tracked_id"; then
    if [ "$focused_id" = "$tracked_id" ] || is_obsidian_window "$focused_id"; then
      hide_popover
      return 0
    fi
  fi

  show_popover
}

case "${1:-toggle}" in
  toggle)
    toggle
    ;;
  hide)
    hide_popover
    ;;
  --on-window-created)
    float_window_if_obsidian
    ;;
  *)
    echo "Usage: $0 [toggle|hide|--on-window-created]" >&2
    exit 2
    ;;
esac
