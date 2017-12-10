#!/usr/bin/env sh
#
# This script (un)establishes some links from the $HOME directory 
#

dotfiles_list()
{
    # list of links to be done is obtained through all the
    # *.*linker scripts to be found in this directory.
    # Each *.*linker script is supposed to simply print
    # a string of "file1:target1|file2:target2|..."
    # of links to be done
    #
    for linker in $(ls ~/dotfiles/install/*.*linker) ; do
        printf "%s" $($linker)
    done
}

dotfiles_link()
{
    # establishes some links in the $HOME directory
    # list of links is obtained in function parameter $1
    # or with dotfiles_list function above if no argument is given
    # if destination of link file already exist, the behavior
    # depends on the presence and value of $2
    # if $2 not there, do nothing (i.e. do not override the link)
    # if $2 is there *and* is equal to force, 
    #  then override the link (i.e. erase the target and do the link)
    #
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
    for pair in $(printf "%s\\n" $list | tr '|' ' '); do
        file=$(printf "%s\\n" $pair | cut -d ':' -f 1)
        target=$(printf "%s\\n" $pair | cut -d ':' -f 2)
        # test prior existence of target
        if [ -e $target ]; then
            if [ "$override" != "force" ]; then
                printf "%s\\n" "~${target#$HOME} already exists... Skipping."
                continue
            else
                rm -f $target
            fi
        fi
        # be sure the target parent directory exist
        dir=$(dirname $target)
        mkdir -p $dir
        ln -s "$file" "$target"
    done
}

dotfiles_unlink()
{
    # delete some links in the $HOME directory
    # list of links is obtained with dotfiles_list function above
    # or in $1 parameter if it is given
    #
    local list
    if [ $# -gt 0 ]; then
        list=$1
    else
        list=$(dotfiles_list)
    fi
    for pair in $(printf "%s\\n" $list | tr '|' ' '); do
        target=$(printf "%s\\n" $pair | cut -d ':' -f 2)
        rm -f "$target"
    done
}

dotfiles_linker() {
    local phase=$1 || exit
    local what=$2 || exit
    local script=$what.${phase}linker
    if test -f ~/dotfiles/install/$script; then
        rm -f $script.log
        dotfiles_link $(. ~/dotfiles/install/$script) > $script.log 2>&1
        if [ $? ]; then 
            printf "%s" "$what $phase linker done"
        else
            printf "%s\\n" "failed $phase linker for $what"
            return 1
        fi
    else
        echo "nothing to $phase link for $what (missing ~/dotfiles/install/$script file)"
        return 2
    fi
    return 0
}

dotfiles_exec() {

    local task=$1 || exit
    local what=$2 || exit
    if test -f ~/dotfiles/install/$what.$task.sh; then
        rm -f $what.$task.sh.log
        ~/dotfiles/install/$what.$task.sh > $what.$task.sh.log 2>&1
        if [ $? ]; then 
            printf "%s" "$what $task done"
        else
            printf "%s\\n" "failed $task for $what"
            return 1
        fi
    else
        echo "nothing to exec for $what (missing ~/dotfiles/install/$what.$task.sh file)"
        return 2
    fi
    return 0
}

dotfiles_dryrun() {
    if [ -n "${DOTFILES_DRYRUN+1}" ]; then
        echo "DRY RUN MODE - would exec:" $@
    else
        $@
    fi
}

dotfiles_install()
{
    # performs the install of what=$1
    # installation steps are :
    # 1 - perform prelinks if $what.prelinker exists
    # 2 - execute $what.sh
    # 3 - perform postlinks if $what.postlinker exists
    #
    local what=$1
    printf "%s\n" "--- Installing $what..."

    dotfiles_dryrun dotfiles_linker "pre" $what
    dotfiles_dryrun dotfiles_exec "install" $what
    dotfiles_dryrun dotfiles_linker "post" $what
    return 0
}

dotfiles_install_common()
{
    for what in base16 prezto term tmux fzf dotconfig dvim; do
        dotfiles_install $what || break 
    done
}

dotfiles_install_linux()
{
    for what in xorg linux-fonts; do
        dotfiles_install $what || break 
    done
}

dotfiles_install_osx()
{
    # we loop on all brew-*.sh and osx-*.sh files

    for what in $(ls -1 ~/dotfiles/install/(osx|brew)* | cut -d '.' -f 1 | tr '\n' ' '); do
        dotfiles_install $(basename $what) || break
    done
}

dotfiles_install_all()
{
    if [ "$(uname)" = "Darwin" ]; then
        dotfiles_install_osx
    fi
    if [ "$(uname)" = "Linux" ]; then
        dotfiles_install_linux
    fi
    dotfiles_install_common
}

# vim: set ft=zsh
