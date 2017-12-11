This is largely inspired by https://github.com/nicknisi/dotfiles but _trying_ to keep only what I need (and/or understand...)

# Cold bootstrap

Assuming I get a new machine / new user, the initial setup should be :

- have git installed
- insure the user's shell is set to zsh (e.g. using chsh on Linux) and the user can do sudo
- git clone https://github.com/aphecetche/dotfiles.git ~/dotfiles
- cd dotfiles #so you get the log files contained
- . ./install.sh

Note that you may be asked your (sudo) password a few times.

Note also that at some point the 1Password setup requires Dropbox to be itself setup, so at this point the Dropbox password is needed.

Then log off, log in and select a base16 theme to work with by using : `base16_` tab completion (need to do this only
once, information is kept in ~/.base16_theme link), if the default one that is installed by default no longer suits your
taste...

Also, for Docker use, insure the user is a member of the docker group (or whatever group has been chosen for docker...)

Note that under (Arch) Linux that step should be done in non graphical mode preferably (as it setups some Xorg stuff)

Locally the dev of those scripts can be done preparing a test user (ArchLinux syntax) : 

```zsh
sudo userdel testuser && sudo rm -rf /home/testuser && sudo useradd -m testuser && sudo passwd testuser && sudo chsh testuser -s /bin/zsh && usermod -G docker
```

and testing the installation from scratch under that user.

# Fonts

Currently using Inconsolata (arch package name ttf-inconsolata). Need powerline-fonts as well for some eye-candy on
the status bar(s).

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

### Arch Linux python modules for YouCompleteMe

Turns out I was missing a couple of Python modules with my base ArchLinux installation (check the list of installed python modules
with `pydoc modules`) to be able to install YCM natively.
```
sudo pacman -S python-future
sudo pacman -S python-frozendict
sudo pacman -S python-requests

```
