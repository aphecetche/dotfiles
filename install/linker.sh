#!/usr/bin/env sh 

# This script (un)establishes some links from the $HOME directory 
#
# the list of links to be done is obtained through all the
# *.linker scripts to be found in this directory.
# Each *.linker sccript is supposed to simply print
# a string of "file1:target1|file2:target2|..."
# of links to be done
#

dotfiles_list()
{
    for linker in $(ls $DOTFILES/install/*.linker) ; do
        echo -n $($linker)
    done
}

dotfiles_link()
{
    local list
    if [ $# -gt 0 ]; then
        list=$1
    else
        list=$(dotfiles_list)
    fi
    override="no"
    if [ $# -gt 1 ]; then
        override=$2
    fi
    for pair in $(echo $list | tr '|' ' '); do
        file=$(echo $pair | cut -d ':' -f 1)
        target=$(echo $pair | cut -d ':' -f 2)
        # test prior existence of target
        if [ -e $target ]; then
            if [ "$override" != "force" ]; then
                echo "~${target#$HOME} already exists... Skipping."
                continue
            else
                rm -f $target
            fi
        fi
        # be sure the target parent directory exist
        dir=$(basename $target)
        mkdir -p $dir
        ln -s $file $target
    done
}

dotfiles_unlink()
{
    local list
    if [ $# -gt 0 ]; then
        list=$1
    else
        list=$(dotfiles_list)
    fi
    for pair in $(echo $list | tr '|' ' '); do
        target=$(echo $pair | cut -d ':' -f 2)
        rm -f $target
    done
}
