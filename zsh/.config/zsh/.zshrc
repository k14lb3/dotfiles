# Load functions
source "$ZDOTDIR/config/functions.zsh"

zsh_add_file "config/theme.zsh"

# Completions
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ":completion:*" menu select
zmodload zsh/complist

autoload -Uz colors && colors

zsh_add_file "config/exports.zsh"
zsh_add_file "config/aliases.zsh"
zsh_add_file "config/settings.zsh"
zsh_add_file "config/os.zsh"
zsh_add_file "config/foo.zsh"

source "$HOME/restoplus/config/.zshrc"
