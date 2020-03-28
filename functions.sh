# cd and ls
function cl() {
    DIR="$*";
        # if no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    cd "${DIR}" && \
    # use your preferred ls command
        ls -FG
}

function fmt_name() {
    FILE="$1";
    mv "$FILE" `echo $FILE | tr '[:blank:]' '_' | tr '[:upper:]' '[:lower:]'`;
}

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
      ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
      fi
  else
      ## check the current folder belong to earlier VIRTUAL_ENV folder
      # if yes then do nothing
      # else deactivate current virtualenv and activate sys virtualenv
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
        source $HOME/.virtualenvs/sys/bin/activate
      fi
  fi
}
