#!/bin/sh

# there are two options here to get nice symbol fonts
# 1 - use patched fonts, i.e. fonts prepared with some extra symbols
# 2 - use regulard fonts and define some fallbacks fonts for the glyphs not found in the primary font

# bottom line : if you find a patched font, that's the easiest route.
# If you want more control (e.g. to get more weights, as patched fonts
# seems to be usually only "regular" thickness), use the fallback
# solution...

osx_install_font_fallback() {

    # get the "regular" monospace fonts we'd like to use

    brew tap caskroom/fonts 
    for font in hack; do
        brew cask install font-$font
    done

    # get the awesome symbol fonts for some eye candy in the terminal...
    # the strategy used is that of fallback fonts, not a patched fonts

    if ! test -d $HOME/github.com/gabrielelana/awesome-terminal-fonts; then
        mkdir -p $HOME/github.com/gabrielelana
        cd $HOME/github.com/gabrielelana
        git clone https://github.com/gabrielelana/awesome-terminal-fonts.git
        # we install them for the current user only
        cp awesome-terminal-fonts/build/*.ttf ~/Library/Fonts
    fi

    # tweak the fallback fonts in order to be able to use them... 

    for font in FontAwesome icomoon; do
        /usr/libexec/PlistBuddy -c 'Add :monospace:0 $font'
        /System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreText.framework/Resources/DefaultFontFallBacks.plist
    done

}

osx_install_font_patched() {

    # simply use homebrew-fonts for the task ;-)

    brew tap caskroom/fonts 
    for font in inconsolata-nerd-font hack-nerd-font sourcecodepro-nerd-font firacode-nerd-font firamono-nerd-font; do
        brew cask install font-$font
    done
}

osx_uninstall_all_user_fonts() {
  brew cask uninstall $(brew cast list | grep font\-)
}

osx_install_font_patched

