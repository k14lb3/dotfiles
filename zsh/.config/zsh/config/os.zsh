case "$OSTYPE" in
  darwin*)
    zsh_add_file "config/os/macos.zsh"
  ;;
  linux*)
    zsh_add_file "config/os/linux.zsh"
  ;;
esac
