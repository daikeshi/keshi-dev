# Oh My Zsh normally initializes completion before this file is sourced.
# Initialize it only when this file is used on its own.
if (( ! $+functions[compdef] )); then
    autoload -Uz compinit
    compinit
fi
