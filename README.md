This is largely inspired by https://github.com/nicknisi/dotfiles but _trying_ to keep only what I need (and/or understand...)

# Cold bootstrap

Assuming I get a new machine / new user, the initial setup should be :

- insure the user's shell is set to zsh (e.g. using chsh on Linux)
- git clone https://github.com/aphecetche/dotfiles.git ~/dotfiles
- cd dotfiles
- ./install.sh

Note that under (Arch) Linux that step should be done in non graphical mode preferably (as it setups some Xorg stuff)

## Notes about special files for Linux 
 
### Keyboard (MacbookPro 15.4 Retina AZERTY - french)

`barfix.map` : the get the pipe with the Alt+Shift+L (both left and right Alt or Shift) in the console

```
❯ localectl
System Locale: LANG=fr_FR.UTF-8
VC Keymap: /usr/local/share/kbd/keymaps/barfix.map
X11 Layout: fr
X11 Model: apple
X11 Variant: fr_mac
```

`Xkeymap` : to invert `at` and `less than` so they are no longer swapped. Using it by adding :

```
test -f $HOME/.Xkeymap && xkbcomp $HOME/.Xkeymap $DISPLAY
```

at the end of my `$HOME/.xinitrc`
