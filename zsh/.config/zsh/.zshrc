#!/usr/bin/env zsh

# ┏━━━━━━━┓
# ┃ zshrc ┃
# ┗━━━━━━━┛

() {
  local -r CONFIGS=(exports options aliases plugins binds misc)

  for CONFIG in "${CONFIGS[@]}"; do
    source "${ZDOTDIR}/config/${CONFIG}" &>/dev/null
  done
}
