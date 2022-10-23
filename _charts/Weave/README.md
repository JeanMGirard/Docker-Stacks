
docker plugin install weaveworks/net-plugin:latest_release

docker plugin (enable/disable) weaveworks/net-plugin:latest_release


**you must permit traffic to flow through TCP 6783 and UDP 6783/6784, which are Weave’s control and data ports.**

weave launch --host {WAEVE_LOCAL_IP (optional)}