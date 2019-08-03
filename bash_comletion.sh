SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Bash autocomplete
# system
export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh
# git
source $SCRIPTPATH/git_completion.bash
# kubectl
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)
# terraform
complete -C /usr/local/Cellar/tfenv/1.0.0/versions/0.12.5/terraform terraform

### NVM
export NVM_DIR="$HOME/.nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

