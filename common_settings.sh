#!/bin/zsh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Load alias
source $SCRIPTPATH/alias.sh

### Load bash functions
source $SCRIPTPATH/functions.sh

### Env variables
# system
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:$HOME/google-cloud-sdk/bin
# make sure /usr/local/bin occurs before /usr/bin for brew install
export PATH=/usr/local/bin:$PATH

# keshi
export PATH=$PATH:$HOME/Lib/bin:$HOME/bin
export KESHI_DEV=$HOME/keshi-dev
# java
export JAVA_OPTS="-Xmx4096m"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# sbt
export SBT_OPTS='-Xms512m -Xmx2048m -XX:+CMSClassUnloadingEnabled'
# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go
# tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

### Restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi

### Set history size
HISTSIZE=5000
HISTFILESIZE=5000

### Config for pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/shims:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# pyenv activate sys

### Config gcloud path
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/keshi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/keshi/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/keshi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/keshi/google-cloud-sdk/completion.zsh.inc'; fi
export CLOUDSDK_PYTHON=$HOME/.pyenv/shims/python
