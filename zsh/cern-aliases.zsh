
alias ali='source ~/alicesw/alice-env.sh'

alias alice-installer='bash <(curl -fsSL http://alien.cern.ch/alice-installer)'

alias ll='ls -al'

alias token='alien-token-init laphecet'

alias rh='cat $HOME/.root_hist'

alias locate='mdfind -name'

alias dox='source $HOME/Scripts/alice-doxygen.sh'

alias vaf='ssh laphecet@localhost -p 5522 -Y'

alias gssh='gsissh -p 1975'

alias gscp='gsiscp -S `which gsissh` -P 1975'

alias saf3-enter='source $HOME/Scripts/saf3.sh enter'
alias saf3='source $HOME/Scripts/saf3.sh'

alias o2='source $HOME/Scripts/o2-env.sh'

alias cvmfs='source $HOME/Scripts/cvmfs.sh'

alias ks='screen -ls | grep -o "[0-9]\{5\}" | awk "{print $1}"| xargs -I{} screen -S {} -X quit'

alias dhcp-start='sudo /bin/launchctl load -w /System/Library/LaunchDaemons/bootps.plist'

alias dhcp-stop='sudo /bin/launchctl unload -w /System/Library/LaunchDaemons/bootps.plist'


export ALICE_ENV_DONT_UPDATE=1


