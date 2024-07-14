#!/usr/bin/env zsh

# ┏━━━━━━━━┓
# ┃ zlogin ┃
# ┗━━━━━━━━┛

() {
  if [[ "$(tty)" == "/dev/tty1" ]]; then
    Hyprland
  fi
}
