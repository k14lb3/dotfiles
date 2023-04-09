# Powerlevel10k
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION="✔ "
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION="✔ "

# WSL
if uname -r | grep -qi "microsoft"; then
  # Exports
  export WINHOME=$(wslpath "$(wslvar USERPROFILE)")

  # Aliases
  alias cpwd="pwd | tr -d '\n' | clip.exe"
  alias cpt="nvim $WINHOME/copy"
fi
