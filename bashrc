
###### Setup all PATHs to lead our way....
echo "Welcome $USER, bash is being setup"

export PS1='[\u@\h] \w 
#->'
#export RPROMPT='[ %25<..<%/ ]'

#unset RPROMPT

# Histort file settings
#HISTFILE=~/.zhistory  # History settings
#HISTSIZE=1000
#SAVEHIST=1000                # Default: 200

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc

alias ls='ls --color'
alias ll='ls -l'
alias gvim="gvim -X  2>/dev/null"


if [ `hostname` == "blr-lin-615" ]
then
    export DEPOT_EMULATED_PLATFORM="rhe5-amd64"
    export DISPLAY=":0.0"
fi


source /arm/tools/setup/init/bash

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
shopt  -s histappend
export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

MANPATH=~/bin/share/man:$MANPATH

# add pbuild
PATH=$PATH:/arm/devsys-tools/abs:
export PATH
export PATH=/work/app_root/bin:/home/shathi01/bin/bin:$PATH:
export PATH=$PATH:/home/shathi01/.local/bin/


module load arm/cluster
module load arm util core
module load eda
module load swdev

#module load arm/rvds/4.0
module load arm/rvct/4.1.561
module load scons
module load python/python/2.7
module load tigris/subversion/1.6.2
module load git/git/1.7.3.2
module load gnu/flex/2.5.35
module load gnu/bison/2.4.3

if [ `hostname` != "blr-lin-615" ]
then
    module load vim/vim/7.3
fi

#xset b off

unset PROMPT_COMMAND

export LSB_DEFAULTPROJECT=PJ00332


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

#make the work dir
function msg()
{
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set"
    else
        cur_dir=`pwd`
        cd $WORKDIR
        scons mode=sg
        cd $cur_dir
        unset cur_dir
    fi

    echo -n ''
}

#make the work dir
function msa()
{
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set"
    else
        cur_dir=`pwd`
        cd $WORKDIR
        scons mode=sa
        cd $cur_dir
        unset cur_dir
    fi

    echo -n ''
}

#clean the workdir
function c()
{
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set"
    else
        cur_dir=`pwd`
        cd $WORKDIR
        scons -c
        cd $cur_dir
        unset cur_dir
    fi
}

#create tags in the workdir
function t()
{
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set"
    else
        cur_dir=`pwd`
        cd $WORKDIR
        make tags
        cd $cur_dir
        unset cur_dir
    fi
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

function grepri()
{
    grep -Ri $1 * | grep -v ".svn"
}


function src(){
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set. Please run the workon command before you user w()"
    else
        cd $WORKDIR/src
    fi
}

function inst(){
    if [ -z $WORKDIR ];
    then
        echo "WORKDIR not set. Please run the workon command before you user w()"
    else
        cd $WORKDIR/src/Instructions
    fi
}

function setup_eagle_rtl()
{
    if [ `hostname` == "blr-lin-615" ]
    then
        echo "setup_eagle_rtl cannot be run on blr-lin-615"

    else
        export EAGLE_HOME=/arm/validation1/shathi01/eagle_val/trunk
            workon $EAGLE_HOME
            source $EAGLE_HOME/logical/shared/tools/bin/eagle_rtl_setup_bash
            cd     $EAGLE_HOME/logical/testbench/eag_top/sim
    fi
}

function cexec
{
    bsub -qnormal -R "rhe5 && os64" -PPJ00332 -o bsub_log $*
}


function icexec
{
    bsub -Is -qinter -R "rhe5 && os64" -PPJ00332 $*
}

export PATH=$PATH:/work/go/bin
export GOROOT=/work/go
export GOARCH=amd64
export GOOS=linux

export EDITOR=vim
