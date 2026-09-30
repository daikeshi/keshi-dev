#!/bin/zsh

# Resolve this file's directory when sourced from either Zsh or Bash.
if [ -n "${ZSH_VERSION:-}" ]; then
    _keshi_source=${(%):-%x}
else
    _keshi_source=${BASH_SOURCE[0]}
fi
SCRIPTPATH="$(cd "$(dirname "$_keshi_source")" && pwd -P)"
unset _keshi_source

source "$SCRIPTPATH/alias.sh"
source "$SCRIPTPATH/functions.sh"
export KESHI_DEV="$SCRIPTPATH"

# Add user-installed tools only when their directories exist.
for _keshi_bin_dir in "$HOME/.cargo/bin" "$HOME/go/bin" "$HOME/.local/bin" "$HOME/bin"; do
    if [ -d "$_keshi_bin_dir" ]; then
        case ":$PATH:" in
            *":$_keshi_bin_dir:"*) ;;
            *) PATH="$PATH:$_keshi_bin_dir" ;;
        esac
    fi
done
export PATH
unset _keshi_bin_dir

# Use the selected JDK without pinning a version in the shell.
if [ -z "${JAVA_HOME:-}" ] && [ -x /usr/libexec/java_home ]; then
    JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null) && export JAVA_HOME
fi

HISTSIZE=5000
HISTFILESIZE=5000
SAVEHIST=5000

# Homebrew provides pyenv; skip initialization until it is installed.
# Rehash shims manually after installing new Python command-line tools.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if command -v pyenv >/dev/null 2>&1; then
    if [ -n "${ZSH_VERSION:-}" ]; then
        eval "$(pyenv init - --no-rehash zsh)"
    else
        eval "$(pyenv init - --no-rehash bash)"
    fi
    if command -v pyenv-virtualenv-init >/dev/null 2>&1; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
