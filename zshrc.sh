SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Load generic bash config
source $SCRIPTPATH/common_settings.sh

### oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"
# plugins
plugins=(
    git
    zsh-autosuggestions
    kubectl
    encode64
)
# reload oh-my-zsh
source $ZSH/oh-my-zsh.sh

###  POWERLEVEL9K customized settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
# Add new line after each prompt
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# Git status color
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’

### Zsh autocompletion
source $SCRIPTPATH/zsh_completion.sh

### Zsh autosuggestion
bindkey '^ ' autosuggest-accept
bindkey '^[[[CE' autosuggest-execute

### Zsh syntax highlighting
# brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

