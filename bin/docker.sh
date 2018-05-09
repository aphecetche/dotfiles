
dvscp() {
    # copy a docker volume to another host
    #docker run --rm -v <SOURCE_DATA_VOLUME_NAME>:/from alpine ash -c "cd /from ; tar -cf - . " | ssh <TARGET_HOST> 'docker run --rm -i -v <TARGET_DATA_VOLUME_NAME>:/to alpine ash -c "cd /to ; tar -xvf - " '
}

dvolume2archive() {
    # make a tar.gz of a docker volume
    local volume_name=$1

    $(docker volume ls | grep $volume_name 2>&1 > /dev/null) \
        && \
        { 
            docker run -it --rm -v $volume_name:/data -v $(pwd):/backup alpine:3.5 tar zcvf /backup/$volume_name.tar.gz /data \
                && printf "%s\\n" "archive $volume_name.tar.gz successfully created" \
                || printf "%s\\n" "could not create archive $volume_name"
        } \
            || \
            printf "%s\\n" "volume $volume_name does not exist. Can not archive it !"
}

darchive2volume() {
    # reverse operation from dvolume2archive : take an archive and populate
    # a volume with it
    # will fail if the target volume already exist !

    local volume_name=$2

    local archive_dir=$(dirname $1)
    local archive=$(basename $1)

    $(docker volume ls | grep $volume_name > /dev/null 2>&1)

    if [ $? = 0 ]; then 
        printf "%s\\n" "volume $volume_name already exists ! will not overwrite it !"
    else
        docker run -it --rm -v $volume_name:/dest -v $archive_dir:/src alpine:3.5 tar -zxvf /src/$archive -C /dest
    fi
}

dvclone() {
    # clone a volume into another one
    # inspired from https://github.com/gdiepen/docker-convenience-scripts

    #First check if the user provided all needed arguments
    if [ "$1" = "" ]
    then
        echo "Please provide a source volume name"
        exit
    fi

    if [ "$2" = "" ] 
    then
        echo "Please provide a destination volume name"
        exit
    fi

    #Check if the source volume name does exist
    docker volume inspect $1 > /dev/null 2>&1
    if [ "$?" != "0" ]
    then
        echo "The source volume \"$1\" does not exist"
        exit
    fi

    #Now check if the destinatin volume name does not yet exist
    docker volume inspect $2 > /dev/null 2>&1

    if [ "$?" = "0" ]
    then
        echo "The destination volume \"$2\" already exists"
        exit
    fi



    echo "Creating destination volume \"$2\"..."
    docker volume create --name $2  
    echo "Copying data from source volume \"$1\" to destination volume \"$2\"..."
    docker run --rm \
        -i \
        -t \
        -v $1:/from \
        -v $2:/to \
        alpine:3.5 ash -c "cd /to ; cp -a /from/* ."

}


dexist() {
    # whether container exist or not
    
    for d in $(docker ps -q -a); do
        name=$(docker inspect -f "{{ .Name }}" $d)
        [[ "/$1" == "$name" ]] && return 0  
    done
    return 1 
}

getdirlist() {
    for par in $@; do
        abs_path=$(unset CDPATH && cd "$(dirname $par)" > /dev/null 2>&1 && pwd) && printf "\"%s\"\\n" $abs_path
    done 
}

dvim() {

	# must get a list of basedirs in order to insure we are
	# mounting them in the container

	firstdir=""
	cmd="docker run -it --rm -e BASE16_THEME=$BASE16_THEME "

	for dir in $(getdirlist $@ | sort | uniq); do
        # printf "%s\\n" "dir=$dir"
		 cmd="$cmd -v \"$dir\":\"$dir\""
        # printf "%s\n" "cmd=$cmd"
		 if [ -n "$firstdir" ]; then
		 	firstdir="$dir"
		 	cmd="$cmd -w $firstdir"
		 fi
	done

    if test -n "$DVIM_LIVEDOWN_PORT"; then
        cmd="$cmd -p $DVIM_LIVEDOWN_PORT:$DVIM_LIVEDOWN_PORT"
    fi
    if test -n "$DVIM_YCM_EXTRA_CONF"; then
        cmd="$cmd -v $DVIM_YCM_EXTRA_CONF:$HOME/.ycm_extra_conf.py"
    fi
    if test -n "$DVIM_DOCKER"; then
        # docker options passed "as is"
        cmd="$cmd $DVIM_DOCKER"
    fi
    if test -n "$DVIM_GO"; then
        cmd="$cmd -v vc_go_tools:/go -e GOPATH=$GOPATH -v $GOPATH:$GOPATH"
    fi
    cmd="$cmd dvim-$USER"
    for par in $@; do
        abs_path=$(cd $(dirname "$par") > /dev/null 2>&1 && pwd) && cmd="$cmd \"$abs_path/$(basename $par)\"" || ( touch $par && cmd="$cmd \"$abs_path/$(basename $par)\"")
    done

    if test -n "$DVIM_DEBUG"; then
        echo "cmd=$cmd"
    else
        eval $cmd
    fi
	unset dir
	unset firstdir
	unset cmd
    unset abs_path
}