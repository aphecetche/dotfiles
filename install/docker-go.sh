# "install" go-tools

docker volume rm vc_go_tools > /dev/null 2>&1 
docker volume create --name vc_go_tools 

docker run -it --rm -v vc_go_tools:/data jare/go-tools /bin/sh -c "cd /data; cp -a /usr/lib/go/* ."


