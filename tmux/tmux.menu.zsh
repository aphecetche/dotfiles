#!/usr/bin/env zsh 
#
# abort if we're already inside a TMUX session
# [[ -z "$TMUX" ]] || exit 0

defaultSessionName="default"

# startup a "default" session if none currently exists
tmux has-session -t $defaultSessionName || tmux new-session -s $defaultSessionName -d

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S" | tr "\n" " ") "NEW SESSION" "ZSH")
echo "Available sessions"
echo "------------------"
echo " "
select opt in ("A" "B" "NEW SESSION" "ZSH") 
do
    case $opt in
        "NEW SESSION")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        "ZSH")
            zsh --login
            break
			;;
        *)
            tmux attach-session -t $opt
            break
            ;;
    esac
done

