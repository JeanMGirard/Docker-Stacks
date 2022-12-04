FROM ubuntu AS dmnet-ca
#MAINTAINER Jean M. Girard <Jean.M.Girard@Outlook.com>

RUN mkdir -p /etc/kubernetes/CA-Certificates /etc/kubernetes/CA-SSH
WORKDIR /etc/kubernetes

#COPY csr.conf .
#COPY requests/ ./CA-Certificates/requests

#RUN openssl genrsa -out ca.key 2048
#RUN openssl req -new -x509 -nodes -out ca.crt -key ca.key -subj "/CN=127.0.0.1" -days 10000

COPY certs/   CA-Certificates/
COPY private/ CA-SSH/


FROM alpine
MAINTAINER Jean M. Girard <Jean.M.Girard@Outlook.com>
COPY --from=dmnet-ca /etc/kubernetes/CA-Certificates /data/dmnet/certs
COPY --from=dmnet-ca /etc/kubernetes/CA-SSH          /data/dmnet/ssh
VOLUME /data/dmnet
