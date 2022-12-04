
function start-nexus{
  kubectl apply `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.service.yml")
}


function stop-nexus{
  kubectl delete `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "nexus.service.yml")
}
start-nexus
