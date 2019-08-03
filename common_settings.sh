SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

### Load alias
source $SCRIPTPATH/alias.sh

### Load bash functions
source $SCRIPTPATH/functions.sh

### Env variables
# system
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
# keshi
export PATH=$PATH:$HOME/Lib/bin
export KESHI_DEV=$HOME/keshi-dev
# java
export JAVA_OPTS="-Xmx4096m"
# sbt
export SBT_OPTS='-Xms512m -Xmx2048m -XX:+CMSClassUnloadingEnabled'
# go
export GOPATH=$HOME/go

### Restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi

### Set history size
HISTSIZE=5000
HISTFILESIZE=5000

