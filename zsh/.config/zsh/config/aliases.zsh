case "$OSTYPE" in
  darwin*)
    alias cpwd="pwd | tr -d '\n' | pbcopy"
  ;;
  linux*)
    if uname -r | grep -qi "microsoft"; then
      alias cpt="nvim $WINHOME/copy"
      alias cpwd="pwd | tr -d '\n' | clip.exe"
    else
      # :3
    fi
  ;;
esac

alias ls="lsd"
alias ytdl="youtube-dl"
