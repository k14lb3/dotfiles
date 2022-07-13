# Exports
export WINHOME=$(wslpath "$(wslvar USERPROFILE)")

# Aliases
alias cpwd="pwd | tr -d '\n' | clip.exe"
alias cpt="nvim $WINHOME/copy"
