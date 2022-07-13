# Exports
export WINHOME="$(wslpath "$(powershell.exe -NoProfile -NonInteractive -Command "\$Env:UserProfile")")"

# Aliases
alias cpt="nvim $WINHOME/copy"
alias cpwd="pwd | tr -d '\n' | clip.exe"
