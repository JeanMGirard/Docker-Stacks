function setup-gitlab{
  helm repo add gitlab https://charts.gitlab.io/ ;  helm repo update
  helm upgrade --install gitlab gitlab/gitlab --timeout 600 `
    --set global.hosts.domain=gitlab.developers.dimgo.net `
    --set global.hosts.externalIP=192.168.1.1 `
    --set certmanager-issuer.email=developers@security.dimgo.net

  # kubectl get secret <name>-gitlab-initial-root-password -ojsonpath={.data.password} | base64 --decode ; echo
}

function start-gitlab{
  kubectl apply `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.service.yml")
}


function stop-gitlab{
  helm delete gitlab
  kubectl delete `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "gitlab.service.yml")
}



start-gitlab
