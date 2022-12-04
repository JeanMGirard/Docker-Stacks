. E:\Network\src\windows\load-utilities.ps1

# dsfdsfdsfdsf45646gddfgd
$OVPN_DATA_VOL="ovpn-data"
$OVPN_DATA_DIR="E:\Network\.data\cluster\openvpn"
mkdir     $OVPN_DATA_DIR
mkdir     "E:\Network\modules\openvpn\data"

docker-compose run --rm openvpn ovpn_genconfig -u udp://connect.dimgo.net
docker-compose run --rm openvpn ovpn_initpki
docker-compose up -d openvpn
docker-compose run --rm openvpn easyrsa build-client-full client-2 nopass
docker-compose run --rm openvpn ovpn_getclient client-2 | set-content clients/client-2.opvn
