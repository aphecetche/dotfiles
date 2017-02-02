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

dotfiles_install()
{
  local what=$1
  printf "%s" "installing $what..."
  if test -f ~/dotfiles/install/$what.prelinker; then
      rm -f $what.prelinker.log
      dotfiles_link $(. ~/dotfiles/install/$what.prelinker) > $what.prelinker.log 2>&1 \
          && { printf "%s" "$what (pre)links established..."; } \
          || { printf "%s\\n" "failed to (pre)link $what"; return 1; }
  fi
  
  rm -f $what.log
  if test -f ~/dotfiles/install/$what.sh; then
      ~/dotfiles/install/$what.sh > $what.log 2>&1 \
          && { printf "%s" "$what installed..."; } \
          || { printf "%s\\n" "failed to install $what"; return 2; }
  fi

  if test -f ~/dotfiles/install/$what.postlinker; then
      rm -f $what.postlinker.log
      dotfiles_link $(~/dotfiles/install/$what.postlinker) > $what.postlinker.log 2>&1 \
          && { printf "%s" "$what (post)links established."; } \
          || { printf "%s\\n" "failed to (post)link $what"; return 3; }
  fi
  printf "%s\\n"
}

dotfiles_install_common()
{
    for what in base16 prezto term tmux fzf dotconfig dvim; do
        dotfiles_install $what || break 
    done
}

dotfiles_install_linux()
{
    for what in xorg; do
        dotfiles_install $what || break 
    done
}

dotfiles_install_osx()
{
    for what in brew $(ls -1 ~/dotfiles/install/osx* | cut -d '.' -f 1 | tr "\n" " "); do
        dotfiles_install $what || break
    done
}

dotfiles_install_all()
{
    dotfiles_install_common
    if [ "$(uname)" = "Darwin" ]; then
        dotfiles_install_osx
    fi
    if [ "$(uname)" = "Linux" ]; then
        dotfiles_install_linux
    fi
}

# vim: set ft=zsh
