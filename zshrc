# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    ansible
    argocd
    aws
    azure
    bun
    celery
    command-not-found
    dbt
    direnv
    docker
    docker-compose
    emoji
    fluxcd
    fzf
    gcloud
    genpass
    gh
    git
    git-commit
    github
    gitignore
    git-lfs
    golang
    helm
    history-substring-search
    isodate
    kubectl
    kube-ps1
    mise
    node
    npm
    opentofu
    pip
    postgres
    redis-cli
    rsync
    safe-paste
    ssh
    starship
    sudo
    supervisor
    tailscale
    terraform
    tmux
    urltools
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -lhF'
alias la='ls -alhF'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cls="clear"
alias vim="nvim"
alias dc="docker compose"
alias ppy="poetry run python"
alias clip="clip.exe"
alias yank="xsel --input --clipboard"
alias yeet="xsel --output --clipboard"
alias explorer="explorer.exe"
alias toolbox="jetbrains-toolbox"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="nvim"
export GPG_TTY=$(tty)
export QT_SCALE_FACTOR=1.25
export GDK_SCALE=1.25
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.local/bin"
export ZSH_TMUX_AUTO_TITLE_TARGET="pane"
export ZSH_TMUX_AUTO_TITLE_SHORT=true
export ZSH_TMUX_AUTO_TITLE_IDLE_TEXT="%pwd"

# k8s
export KUBECONFIG="$HOME/.kube/config.yaml"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Turso
export PATH="$HOME/.turso:$PATH"

# JetBrains
export PATH="$HOME/.local/share/JetBrains/Toolbox/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

# Vault
export VAULT_ADDR="https://vault.lab.kvd.studio"

# gcloud
if [ -f '/root/.local/bin/google-cloud-sdk/path.zsh.inc' ]; then
    . '/root/.local/bin/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/root/.local/bin/google-cloud-sdk/completion.zsh.inc' ]; then
    . '/root/.local/bin/google-cloud-sdk/completion.zsh.inc'
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
