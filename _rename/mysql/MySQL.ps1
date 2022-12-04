$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

$dbHhost = "127.0.0.1"
$port = 6610
$dbname="dmnetdb"

$user = "dmnet"
$usePass=$true
$passwd="dmnet"

$mysql_config="${ScriptDir}/mysql.cnf"
$mysql_data="${ScriptDir}/data"
$mysql_scripts="${ScriptDir}/scripts"

function newMysql{
    mysqld  --defaults-file="${mysql_config}" `
         --datadir="${mysql_data}" `
         --initialize-insecure  `
         --console 
    
    Write-Output "`r`n Server created`r`n"   
    Write-Output "You should consider changing the root password.. like so:"
    Write-Output "-> connectMysql -e `"ALTER USER 'root'@'localhost' IDENTIFIED BY '***ROOT_PASSWORD***';`""
    Write-Output "You must start the server before intializing it:"
    Write-Output "- cmd1 -> startMysql"
    Write-Output "- cmd2 -> execMysqlScript initialize"
    Write-Output "(optional) You can import development data"
    Write-Output "-> execMysqlScript data"
}
function startMysql{
    mysqld  --defaults-file="${mysql_config}" `
            --datadir="${mysql_data}" `
            --default-authentication-plugin="mysql_native_password"
}
function connectMysql{
    if($usePass) { mysql --host=${dbHhost} --user=${user} --port=${port} -p $args }
    else { mysql --host=${dbHhost} --user=${user} --port=${port} --skip-password $args }
}
function execMysqlScript{
    param (
        [Parameter(Mandatory = $true)] 
        [string] $scriptname
    )
    $query = Get-Content -Path ("${$mysql_scripts}/${scriptname}.sql");
    connectMysql -e "${query}"
}
function describeMysql{
    execMysqlScript show
}


Write-Output "`r`n  newMysql";
Write-Output "  startMysql";
Write-Output "  connectMysql [{args}]";
Write-Output "  execMysqlScript {SCRIPT_NAME}";
Write-Output "  describeMysql `r`n";