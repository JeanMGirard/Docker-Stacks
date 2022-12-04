
function start-jenkins{
  kubectl apply `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.service.yml")
}


function stop-jenkins{
  kubectl delete `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.pv.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.pvc.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.deployment.yml") `
    -f (Join-Path -Path $PSScriptRoot -ChildPath "jenkins.service.yml")
}
start-jenkins



$Plugin = New-Module -name "DvSuite.Plugins.Jenkins" `
-ScriptBlock {
  $Plugin = @{
    FullName
  }
  $SayHelloHelp="Type 'SayHello', a space, and a name.";
  function SayHello ($name) { "Hello, $name" };



  Export-ModuleMember -function SayHello -Variable SayHelloHelp
} -AsCustomObject

$SayHelloHelp
# Type 'SayHello', a space, and a name.
# SayHello Jeffrey
# Hello, Jeffrey
# ------------------------------------------------------
# ------------------------------------------------------
$m = New-Module -ScriptBlock {function Hello ($name) {"Hello, $name"}; functionn Goodbye ($name) {"Goodbye, $name"}} -AsCustomObject
$m
$m | Get-Member
