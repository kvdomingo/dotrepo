case "$OSTYPE" in
  darwin*) export PLATFORM="macos" ;;
  *) [[ -n "$WSL_DISTRO_NAME" ]] && export PLATFORM="wsl" || export PLATFORM="linux" ;;
esac

export PATH="$HOME/.local/share/mise/shims:$PATH"

if [[ "$PLATFORM" = "macos" ]]; then
  eval "$(/opt/homebrew/bin/mise activate zsh --shims)"
else
  eval "$($HOME/.local/bin/mise activate zsh --shims)"
fi
