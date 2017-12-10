#!/bin/sh 

mkdir -p $HOME/.local/share/fonts

baseurl="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts"

# sub patch for font : full filename
#fontlist="$fontlist|Hack/Regular:Knack Regular Nerd Font Complete Mono.ttf"
#fontlist="$fontlist|Inconsolata:Inconsolata for Powerline Nerd Font Complete Mono.otf"
#fontlist="$fontlist|Inconsolata:Inconsolata for Powerline Nerd Font Complete.otf"
#fontlist="$fontlist|DroidSansMono:Droid Sans Mono for Powerline Nerd Font Complete.otf"
#fontlist="$fontlist|FiraCode/Retina:Fura Code Retina Nerd Font Complete Mono.otf"

#fontlist="$fontlist|SourceCodePro/Light:Sauce Code Pro Light Nerd Font Complete Mono.ttf"
fontlist="SourceCodePro/Medium:Sauce Code Pro Medium Nerd Font Complete Mono.ttf"

for font in $( printf "%s" $(printf "%s" "$fontlist" | tr ' ' '!') | tr '|' ' ' ); do
    message=$(printf "%s" $font | cut -d ':' -f 2 | tr '!' ' ')
    fontpath=$(printf "%s" $font | cut -d ':' -f 1)
    filename=$(printf "%s" $font | cut -d ':' -f 2 | sed -e s/!/%20/g)
    url="$baseurl/$fontpath/complete/$filename?raw=true"
    printf "%s" "Downloading $message from $url ..."
    curl -sfL "$url" --output "$HOME/.local/share/fonts/$message" && \
    printf "done\n" || \
    printf "failed\n"
done

