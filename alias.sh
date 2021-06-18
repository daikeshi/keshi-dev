### system
alias ls='ls -FG'
alias ll='ls -lah'
alias lt='du -sh * | sort -hr'
alias ghist='history|grep'
alias count='find . -type f | wc -l'
alias diffs='diff --side-by-side --suppress-common-lines'
alias untar='tar -zxf'
alias gs='gsutil'

### python
alias va='source ./venv/bin/activate'
alias python35=$HOME/.pyenv/versions/3.5.7/bin/python3.5
alias python36=$HOME/.pyenv/versions/3.6.8/bin/python3.6

### git
# go back to git repo top level
alias cg='cd `git rev-parse --show-toplevel`'
# go back to git repo top level and check out master
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull --rebase'

### mvim
alias vim='mvim -v'

### Emacs
alias es='/Applications/Emacs.app/Contents/MacOS/Emacs -nw --daemon'
alias et='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t '
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c '
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

### kubectl
alias k='kubectl'
alias ktop="kubectl get nodes -o=jsonpath=\"{range .items[*]}{.metadata.name}{'\t'}{.status.allocatable.memory}{'\t'}{.status.allocatable.cpu}{'\n'}{end}\""
alias kfp_prod_jobs='kubectl get pod --all-namespaces  --context kf-prod --sort-by=.status.startTime | grep Running | grep -v kubeflow | grep -v kube-system | grep -v istio-system | grep -v velero | grep -v viewer- | grep -v ml-pipeline-ui-artifact | grep -v ml-pipeline-visualizationserver'
alias kfp_dev_jobs='kubectl get pod --all-namespaces  --context kf-dev --sort-by=.status.startTime | grep Running | grep -v kubeflow | grep -v kube-system | grep -v istio-system | grep -v velero | grep -v viewer- | grep -v ml-pipeline-ui-artifact | grep -v ml-pipeline-visualizationserver'
