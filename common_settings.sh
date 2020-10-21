SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Load alias
source $SCRIPTPATH/alias.sh

### Load bash functions
source $SCRIPTPATH/functions.sh

### Env variables
# system
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:$HOME/google-cloud-sdk/bin

# keshi
export PATH=$PATH:$HOME/Lib/bin:$HOME/bin
export KESHI_DEV=$HOME/keshi-dev
# java
export JAVA_OPTS="-Xmx4096m"
# sbt
export SBT_OPTS='-Xms512m -Xmx2048m -XX:+CMSClassUnloadingEnabled'
# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go

### Restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi

### Set history size
HISTSIZE=5000
HISTFILESIZE=5000

