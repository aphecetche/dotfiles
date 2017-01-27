
for ft in Bold Regular Thin UltraLight; do

    link="https://github.com/supermarin/YosemiteSanFranciscoFont/blob/master/System San Francisco Display $ft.ttf?raw=true"

    file=$(basename "$link")
    file=${file/?raw=true/}

    dest="$HOME/.local/share/fonts/'$file'"
    echo $dest
    curl -s -o $dest "$link"
done
