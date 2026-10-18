case "$OSTYPE" in
  darwin*) export PLATFORM="macos" ;;
  *) [[ -n "$WSL_DISTRO_NAME" ]] && export PLATFORM="wsl" || export PLATFORM="linux" ;;
esac

typeset -U path fpath

for brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  [[ -x $brew ]] && { eval "$($brew shellenv zsh)"; break; }
done
unset brew

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# antidote handles updates; OMZ's own updater would git-pull antidote's clone
zstyle ':omz:update' mode disabled

export EDITOR="nvim"
export GPG_TTY=$TTY
export XDG_CONFIG_HOME="$HOME/.config"
export COMPOSE_BAKE=true
export PAGER="less -SRFXMi --mouse --wheel-lines=3"
export KUBECONFIG="$HOME/.kube/config.yaml"
export VAULT_ADDR="https://vault.lab.kvd.studio"
export CLOUDSDK_HOME="$HOME/.local/share/mise/installs/gcloud/latest"
export BUT_THEME="dark"

path=(
  # mise shims cost ~270ms per exec and atuin runs on every command
  "$HOME/.local/share/mise/installs/atuin/latest/.mise-bins"
  "$HOME/.local/share/mise/shims"
  "${KREW_ROOT:-$HOME/.krew}/bin"
  "$HOME/.turso"
  "$HOME/.antigravity-ide/antigravity-ide/bin"
  $path
  "$HOME/.local/bin"
  "$HOME/.local/bin/ic11"
)

if [[ "$PLATFORM" == "macos" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  path=("$HOME/Library/Application Support/JetBrains/Toolbox/scripts" $path)
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
  path=("$HOME/.local/share/JetBrains/Toolbox/bin" "$HOME/.local/share/JetBrains/Toolbox/scripts" $path)
fi
path=("$PNPM_HOME/bin" $path)

if [[ "$PLATFORM" == "wsl" ]]; then
  export BROWSER="wslview"
  export HSA_ENABLE_DXG_DETECTION=1
  # wsl.conf disables appendWindowsPath: every /mnt/c dir on PATH slows mise shims and command lookup
  path+=("/mnt/c/Windows/system32" "/mnt/c/Windows")
fi

completions_dir="$HOME/.local/share/zsh/completions"
fpath=("$completions_dir" $fpath)
# regenerate only when the binary changes; eval'ing it every startup costs ~50ms
if (( $+commands[but] )) && [[ ! -e $completions_dir/_but || $commands[but] -nt $completions_dir/_but ]]; then
  mkdir -p "$completions_dir"
  but completions zsh >| "$completions_dir/_but"
fi
unset completions_dir

source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
antidote load "$HOME/.zsh_plugins.txt"

alias ll='eza -lhF --icons --time-style=long-iso --group-directories-first'
alias la='eza -alhF --icons --time-style=long-iso --group-directories-first'
alias l='eza -F --icons --time-style=long-iso --group-directories-first'
alias cls="clear"
alias vim="nvim"
alias dc="docker compose"
alias ds="docker stack"
alias fly="flyctl"
alias tg="terragrunt"
alias dbtf="$HOME/.local/bin/dbt"
alias gcloud-login-eyva="gcloud auth application-default login --client-id-file=\"${HOME}/eyva/client_secret.json\" --scopes=openid,https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/spreadsheets,https://www.googleapis.com/auth/drive"

if [[ "$PLATFORM" == "macos" ]]; then
  alias yank="pbcopy"
  alias yeet="pbpaste"
  alias update-all="brew update && brew upgrade -y && mise self-update -y && mise upgrade -y && mise prune -y"
else
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
  alias yank="xsel --input --clipboard"
  alias yeet="xsel --output --clipboard"
  alias bat="batcat"
  alias toolbox="jetbrains-toolbox"
  alias update-all="sudo apt update && sudo apt upgrade -y && brew update && brew upgrade -y && mise self-update -y && mise upgrade -y && mise prune -y"
fi

if [[ "$PLATFORM" == "wsl" ]]; then
  alias code="'/mnt/c/Program Files/Microsoft VS Code/bin/code'"
  alias cursor="/mnt/c/Users/Kenneth/AppData/Local/Programs/cursor/resources/app/bin/cursor"
  alias zed="/mnt/c/Users/Kenneth/AppData/Local/Programs/Zed/bin/zed"
  alias clip="clip.exe"
  alias explorer="explorer.exe"
  alias trae="/mnt/c/Users/Kenneth/AppData/Local/Programs/Trae/Trae.exe > /dev/null 2>&1 &"

  notify-send() {
    wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}";
  }
fi

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

precmd() {
  echo -ne "\033_${PWD/#$HOME/~}"; echo -ne "\033\\"
}

eval "$(zoxide init zsh)"
# after fzf and OMZ key-bindings so atuin owns ^R and up-arrow
eval "$(atuin init zsh)"
