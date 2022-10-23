FROM kylemanna/openvpn

EXPOSE 1194/udp
EXPOSE 1194/tcp


WORKDIR /etc/openvpn





# RUN ovpn_genconfig -u udp://dmnet.portmap.io
# RUN ovpn_initpki


# docker run --name openvpn -v ${OVPN_DATA_DIR}:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
# docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full client-1 nopass
# docker run -v ${OVPN_DATA_DIR}:/etc/openvpn --log-driver=none --rm     kylemanna/openvpn ovpn_getclient client-1 | set-content client-1.ovpn
