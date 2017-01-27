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
        echo -n $($linker)
    done
}

dotfiles_link()
{
    # establishes some links in the $HOME directory
    # list of links is obtained with dotfiles_list function above
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
        dir=$(dirname $target)
        mkdir -p $dir
        ln -s "$file" "$target"
    done
}

dotfiles_unlink()
{
    # delete some links in the $HOME directory
    # list of links is obtained with dotfiles_list function above
    local list
    if [ $# -gt 0 ]; then
        list=$1
    else
        list=$(dotfiles_list)
    fi
    for pair in $(echo $list | tr '|' ' '); do
        target=$(echo $pair | cut -d ':' -f 2)
        rm -f "$target"
    done
}

dotfiles_install()
{
  local what=$1
  echo -n "installing $what..."
  if test -f ~/dotfiles/install/$what.prelinker; then
      rm -f $what.prelinker.log
      dotfiles_link $(. ~/dotfiles/install/$what.prelinker) > $what.prelinker.log 2>&1 \
          && { echo -n "$what links established."; } \
          || { echo "failed to link $what"; return 1; }
  fi
  
  rm -f $what.log
  ~/dotfiles/install/$what.sh > $what.log 2>&1 \
      && { echo -n "$what installed..."; } \
      || { echo "failed to install $what"; return 2; }

  if test -f ~/dotfiles/install/$what.postlinker; then
      rm -f $what.postlinker
      dotfiles_link $(~/dotfiles/install/$what.postlinker) > $what.postlinker.log 2>&1 \
          && { echo -n "$what links established."; } \
          || { echo "failed to link $what"; return 3; }
  fi
  echo
}

dotfiles_install_all()
{
    if [ "$(uname)" = "Darwin" ]; then
        dotfiles_install_osx
    fi
    dotfiles_install_linux
}

dotfiles_install_linux()
{
    for what in base16 prezto term tmux fzf dvim; do
        dotfiles_install $what || break 
    done
}

dotfiles_install_osx()
{
    for what in brew osx; do
        dotfiles_install $what || break
    done
}

# vim: set ft=zsh
