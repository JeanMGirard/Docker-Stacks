. E:\Network\src\windows\load-utilities.ps1

$OVPN_DATA_VOL="ovpn-data"
$OVPN_DATA_DIR="E:\Network\.data\cluster\openvpn"
mkdir     $OVPN_DATA_DIR
mkdir     "E:\Network\modules\openvpn\data"
openvpn   --genkey --secret "E:\Network\modules\PKI\CA\dimgo.intranet\ta.key"

Copy-Item -Path        "E:\Network\modules\openvpn\data\pki\crl.pem"   `
          -Destination "E:\Network\modules\openvpn\data\crl.pem" -Force



CopyFilesToFolder      $OVPN_DATA_DIR "E:\Network\modules\openvpn\data"




docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm     kylemanna/openvpn ovpn_genconfig -u udp://connect.dimgo.net
docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki

CopyFilesToFolder  "E:\Network\modules\openvpn\data"    $OVPN_DATA_DIR

docker run --name openvpn -v ${OVPN_DATA_DIR}:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full client-1 nopass
docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm     kylemanna/openvpn ovpn_getclient client-1 | set-content client-1.ovpn


#
#docker volume create --name $OVPN_DATA
docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm     kylemanna/openvpn ovpn_genconfig -u udp://connect.dimgo.net
easyrsa build-ca
# docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki

#------------------------------------------------------
#---------------- run bash now ------------------------
#------------------------------------------------------
docker-compose up -d
docker exec openvpn_ovpn_1 easyrsa build-client-full connector-2 nopass
docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full connector-2 nopass


docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm  kylemanna/openvpn ovpn_getclient connector-2 | set-content connector-2.ovpn


# docker exec openvpn_ovpn_1 easyrsa build-client-full client-1 nopass

#docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm  kylemanna/openvpn ovpn_getclient client-1 | set-content client-1.ovpn



docker stop openvpn ; docker rm openvpn

docker ps ; docker stop openvpn_ovpn_1
docker container  prune --force
docker image      prune --force
docker network    prune --force

remove-item $OVPN_DATA_DIR -Recurse -Force
#docker run --name openvpn -v ${OVPN_DATA_DIR}:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
