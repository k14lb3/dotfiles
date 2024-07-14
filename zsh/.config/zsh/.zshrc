#!/usr/bin/env zsh

# ═══════════════════════════════
# ░█▀▀▀█ ░█▀▀▀█ ░█ ░█ ░█▀▀█ ░█▀▀█
#  ▄▄▄▀▀  ▀▀▀▄▄ ░█▀▀█ ░█▄▄▀ ░█
# ░█▄▄▄█ ░█▄▄▄█ ░█ ░█ ░█ ░█ ░█▄▄█
# ═══════════════════════════════

() {
  local -r CONFIGS=(exports options aliases plugins binds etc)

  for CONFIG in "${CONFIGS[@]}"; do
    source "${ZDOTDIR}/config/${CONFIG}" &>/dev/null
  done
}
