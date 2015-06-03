
###### Setup all PATHs to lead our way....
#echo "Welcome $USER, bash is being setup"
export PS1='[\u@\h] \w 
#->'

alias ls='ls --color'
alias ll='ls -l'

function grepri()
{
    grep -Ri $1 * | grep -v ".svn"
}

function workon()
{
    if [ -z $1 ] || [ $1 == "." ];
    then
        work_dir=`pwd`
    else
        work_dir=$1
    fi

    export WORKDIR=$work_dir
    unset work_dir

    echo "Working on: $WORKDIR"
}

#cd to the work dir
function w()
{
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set. Please run the workon command before you user w()"
    else
        cd $WORKDIR
    fi
}


export EDITOR=vim


alias mpg123='mpg123 -C'
