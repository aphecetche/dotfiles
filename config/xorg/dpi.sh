#!/bin/sh
#
# Set the DPI to either retina or cinema display

screen=""

if [ $# -ne 1 ]; then
    echo "Will try to autodetect screen type"
    # poor's man autodetection
    xrandr | grep 2880 > /dev/null
    if [ $? -eq 0 ]; then
        screen="retina"
    else
        screen="cinema"
    fi
else
    screen=$1
fi

if [ "$screen" = "retina" ]; then
    echo "Configuring for retina"

    # set scaling factor in gtk

    gsettings set org.gnome.desktop.interface scaling-factor 2

    # merge xft dpi settings
    xrdb -merge $HOME/.Xdefaults.220

    xrandr --dpi 220

    export GDK_DPI_SCALE=0.75
    export GDK_SCALE=1.8

elif [ "$screen" = "cinema" ]; then
    echo "Configuring for cinema"

    # set scaling factor in gtk

    gsettings set org.gnome.desktop.interface scaling-factor 1

    # merge xft dpi settings
    xrdb -merge $HOME/.Xdefaults.100

    xrandr --dpi 100
    export GDK_DPI_SCALE=1
    export GDK_SCALE=1
else

    echo "Unknown display type $screen"
    echo "I only know about retina or cinema"
fi
