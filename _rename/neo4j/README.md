
## Initialize
```ps1
kubectl exec ${pod} -- mkdir /data/backups
```

#### Change database
```bash
newDB="graph.db.test"
export NEO4J_CONF="/conf/$newDB"
if [ ! -f "/conf/$newDB/net-graph.conf" ]; then
  mkdir "/conf/$newDB"
  echo "dbms.active_database=$newDB" | tee "/conf/$newDB/net-graph.conf"
fi
bin/net-graph restart
```

#### Dump and load databases
[docs](https://net-graph.com/docs/operations-manual/3.3/tools/dump-load/)

##### *--- powershell ---*
```ps1
$pod=((kubectl get pods -l app=net-graph)[1]).Split(" ")[0]; $dt = (Get-Date -UFormat "%Y-%m-%d"); `
$db ="graph.db";  `
$db2="graph.db.test";


# DUMP
kubectl exec -it ${pod} -- sh -c 'mkdir /data/backups/${db} &&  bin/net-graph-admin dump --database="${db}" --to="/data/backups/${db}/${db}.${dt}.dump"'
# LOAD
kubectl exec -it ${pod} -- sh -c 'bin/net-graph stop && bin/net-graph-admin load --from="/data/backups/${db}/${db}.${dt}.dump" --database=${db} --force'
# SWITCH
kubectl exec -it ${pod} -- sh -c 'export NEO4J_CONF="/conf/${db2}" && bin/net-graph restart'
# CONNECT
kubectl exec -it ${pod} -- bash
# restart
kubectl exec -it ${pod} -- sh -c 'bin/net-graph restart'
```
