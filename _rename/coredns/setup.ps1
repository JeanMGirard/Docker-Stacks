. E:\Network\src\windows\load-utilities.ps1
# openvpnserv

mkdir "E:\Network\.data"
$CDNS_DATA_VOL="CoreDNS-data"
$CDNS_DATA_VOL="E:\Network\.data\cluster\CoreDNS\"


CopyFilesToFolder "E:\Network\modules\CoreDNS\data" $CDNS_DATA_VOL

docker run --rm -i -t -v ./build:/go/src/github.com/coredns/coredns  -w /go/src/github.com/coredns/coredns golang:1.11 make


ocker run -d --name=bind --dns=127.0.0.1 -p 53:53/udp -p 10000:10000  -v ./data:/data -e ROOT_PASSWORD=SecretPassword sameersbn/bind:latest


remove-item $CDNS_DATA_VOL -Recurse -Force

docker container  prune --force
docker image      prune --force
docker network    prune --force
