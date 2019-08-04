SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Zsh autocomplete
# system
autoload -Uz compinit
compinit
# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/1.0.0/versions/0.12.5/terraform terraform
