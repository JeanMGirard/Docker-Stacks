

docker build . -t ldapserver
docker volume create ldap1
$CONTAINER = $(docker run -d -it --privileged `
    --env-file .env             `
    ldapserver /usr/sbin/init   `
    )
docker exec -it $CONTAINER systemctl start httpd.service
docker exec -it $CONTAINER systemctl enable httpd.service

docker exec -it $CONTAINER systemctl start slapd 
docker exec -it $CONTAINER systemctl enable slapd

docker exec -it $CONTAINER bash



docker run -it --rm `
    -h net-ldap `
    -v ldap1:/srv -w /srv `
    --env-file .env `
    --privileged `
    ubuntu bash


# 
docker create -it `
    -h net-ldap `
    -m ldap1:/srv -w /srv `
    --restart always `
    --env-file .env `
    --privileged `
    ubuntu bash



docker run -it `
     -h net-ldap `
     -v E:\Network\systems\LDAP\.data\:/srv -w /srv `
    --env-file .env `
     --privileged `
     centos sh

(docker ps -a) | ForEach-Object { docker rm $_.split(" ")[0] }