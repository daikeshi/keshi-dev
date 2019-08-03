### save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}

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
