#!/bin/sh
#
# Set the DPI to either retina or cinema display

if [ "$1" == "retina" ]; then
    echo "Configuring for retina"

    # set scaling factor in gtk

    gsettings set org.gnome.desktop.interface scaling-factor 2

    # merge xft dpi settings
    xrdb -merge $HOME/.Xdefaults.220

    xrandr --dpi 220

    export GDK_DPI_SCALE=0.75
    export GDK_SCALE=1.8

elif [ "$1" == "cinema" ]; then
    echo "Configuring for cinema"

    # set scaling factor in gtk

    gsettings set org.gnome.desktop.interface scaling-factor 1

    # merge xft dpi settings
    xrdb -merge $HOME/.Xdefaults.100

    xrandr --dpi 100
    export GDK_DPI_SCALE=1
    export GDK_SCALE=1
else
    echo "Unknown display type $1"
    echo "I only know about retina or cinema"
fi
