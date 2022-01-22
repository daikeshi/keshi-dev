#!/bin/zsh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

### Load generic bash config
source $SCRIPTPATH/common_settings.sh

### oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="amuse"

# plugins
plugins=(
    git
    zsh-autosuggestions
    kubectl
    encode64
    virtualenv
    emoji
    kube-ps1
    last-working-dir
)
# reload oh-my-zsh
source $ZSH/oh-my-zsh.sh


### Zsh autocompletion
source $SCRIPTPATH/zsh_completion.sh

### Zsh autosuggestion
bindkey '^ ' autosuggest-accept
bindkey '^[[[CE' autosuggest-execute

### Zsh syntax highlighting
# brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Override kube_ps1 fucntion
kube_ps1 () {
  local reset_color="%{$reset_color%}"
  [[ ${KUBE_PS1_ENABLED} != 'true' ]] && return

  KUBE_PS1="${reset_color}$KUBE_PS1_PREFIX"
  KUBE_PS1+="${KUBE_PS1_COLOR_SYMBOL}$(_kube_ps1_symbol)"
  KUBE_PS1+="${reset_color}$KUBE_PS1_SEPERATOR"
  KUBE_PS1_CONTEXT=`echo ${KUBE_PS1_CONTEXT} | sed 's/gke_//' | cut -d'_' -f1,3,4 | sed 's/_/|/g'`
  KUBE_PS1+="${KUBE_PS1_COLOR_CONTEXT}$KUBE_PS1_CONTEXT${reset_color}"
  KUBE_PS1+="$KUBE_PS1_DIVIDER"
  KUBE_PS1+="${KUBE_PS1_COLOR_NS}$KUBE_PS1_NAMESPACE${reset_color}"
  KUBE_PS1+="$KUBE_PS1_SUFFIX"

  echo "${KUBE_PS1}"
}

### Amuse theme settings
ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=")"
PROMPT='
%{$fg[yellow]%}$(virtualenv_prompt_info)%{$reset_color%}% $emoji[ghost] %{$fg_bold[green]%}%(4~|%-2~/…/%2~|%3~)%{$reset_color%}$(git_prompt_info) $(random_emoji faces) %{$fg_bold[red]%}%*%{$reset_color%} $(kube_ps1)
$ '
KUBE_PS1_COLOR_CONTEXT="%F{green}"
KUBE_PS1_SYMBOL_USE_IMG=true

### Config gcloud path
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/keshi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/keshi/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/keshi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/keshi/google-cloud-sdk/completion.zsh.inc'; fi

export CLOUDSDK_PYTHON=$HOME/.virtualenvs/sys/bin/python
