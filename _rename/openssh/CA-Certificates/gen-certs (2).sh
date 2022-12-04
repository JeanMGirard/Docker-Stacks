#!/bin/bash
MASTER_IP="127.0.0.1"
DAYS="1000"
CERTS="certs"
KEYS="private"
REQS="requests"


openssl genrsa -out ${KEYS}/ca.key 2048
openssl req -new -x509 -nodes -out ${CERTS}/ca.crt -key ${KEYS}/ca.key -subj "/CN=${MASTER_IP}" -days 10000

openssl genrsa -out ${KEYS}/admin.key 2048
openssl genrsa -out ${KEYS}/server.key 2048
openssl genrsa -out ${KEYS}/client.key 2048
openssl genrsa -out ${KEYS}/kube-apiserver.key 2048
openssl genrsa -out ${KEYS}/kube-proxy-server.key 2048
openssl genrsa -out ${KEYS}/kube-proxy-client.key 2048


openssl req -new -out ${REQS}/admin.csr -key ${KEYS}/admin.key -config csr.conf
openssl req -new -out ${REQS}/server.csr -key ${KEYS}/server.key -config csr.conf
openssl req -new -out ${REQS}/client.csr -key ${KEYS}/client.key -config csr.conf
openssl req -new -out ${REQS}/kube-apiserver.csr -key ${KEYS}/kube-apiserver.key -config csr.conf
openssl req -new -out ${REQS}/kube-proxy-server.csr -key ${KEYS}/kube-proxy-server.key -config csr.conf
openssl req -new -out ${REQS}/kube-proxy-client.csr -key ${KEYS}/kube-proxy-client.key -config csr.conf


openssl x509 -req -in ${REQS}/admin.csr -out ${CERTS}/admin.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
openssl x509 -req -in ${REQS}/server.csr -out ${CERTS}/server.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
openssl x509 -req -in ${REQS}/client.csr -out ${CERTS}/client.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
openssl x509 -req -in ${REQS}/kube-apiserver.csr -out ${CERTS}/kube-apiserver.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
openssl x509 -req -in ${REQS}/kube-proxy-server.csr -out ${CERTS}/kube-proxy-server.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
openssl x509 -req -in ${REQS}/kube-proxy-client.csr -out ${CERTS}/kube-proxy-client.crt -CA ${CERTS}/ca.crt -CAkey ${KEYS}/ca.key -CAcreateserial -days 10000 -extensions v3_ext -extfile csr.conf
