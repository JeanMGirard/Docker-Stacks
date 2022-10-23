. E:\Network\src\windows\load-utilities.ps1
mkdir "E:\Network\.data"
$NGINX_DATA_VOL="nginx-proxy-data"
$NGINX_DATA_DIR="E:\Network\.data\cluster\nginx-proxy\"


CopyFilesToFolder "E:\Network\modules\nginx-proxy\data" $NGINX_DATA_DIR


 curl -H "Host: intranet.dimgo.net" localhost

remove-item $NGINX_DATA_DIR -Recurse -Force

docker container  prune --force
docker image      prune --force
docker network    prune --force
