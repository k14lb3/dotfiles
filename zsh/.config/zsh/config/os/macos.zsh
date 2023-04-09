# Exports
export PATH="$HOME/Library/Python/3.8/bin:$PATH"

# Aliases
alias cpwd="pwd | tr -d '\n' | pbcopy"

if [[ $(uname -m) == 'arm64' ]]; then
  # Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
