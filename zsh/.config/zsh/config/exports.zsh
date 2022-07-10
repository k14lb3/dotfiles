# General
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"

if uname -r | grep -qi "microsoft"; then
  export WINHOME="$(wslpath "$(powershell.exe -NoProfile -NonInteractive -Command "\$Env:UserProfile")")"
fi

# History
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.zsh_history"

# vim mode
export KEYTIMEOUT=1

# nvm
export NVM_DIR="$HOME/.nvm"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
