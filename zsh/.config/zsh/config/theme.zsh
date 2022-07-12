# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

source "${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme"

if [[ $OSTYPE != darwin* ]]; then
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔ '
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔ '
fi
