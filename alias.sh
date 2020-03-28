### system
alias ls='ls -FG'
alias ll='ls -lah'
alias lt='du -sh * | sort -hr'
alias gh='history|grep'
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

