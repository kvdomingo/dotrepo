alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cls="clear_console"
alias vim="nvim"
alias k8="kubectl"
alias dc="docker compose"
alias prpy="poetry run python"
