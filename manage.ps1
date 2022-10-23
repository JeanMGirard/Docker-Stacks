$env:dmnet_dir = "E:\Network\services"

docker-compose `
  -f docker-compose.yml `
  -f nginx/docker-compose.yml `
  -f registry/docker-compose.yml `
  -f crate-db/docker-compose.yml `
  -f adminer/docker-compose.yml `
  -f bind-dns/docker-compose.yml `
  up

function start-dns{
  docker-compose `
    -f docker-compose.yml `
    -f bind-dns/docker-compose.yml `
    up
}