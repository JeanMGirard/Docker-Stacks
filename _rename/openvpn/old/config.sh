

./data/ovpn_env.sh

easyrsa --pki-dir=$pkidir/openvpn.local build-server-full openvpn.local nopass --req-cn= --subject-alt-name
easyrsa --pki-dir=$pkidir/openvpn.local build-client-full client-1 nopass
OVPN_CN
