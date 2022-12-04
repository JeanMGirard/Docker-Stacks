minikube start --alsologtostderr  --profile dmkubeminikube start --alsologtostderr  --profile dmkube --cpus 4 --memory 4096 --vm-driver hyperv --hyperv-virtual-switch kubeswitch --extra-config=apiserver.authorization-mode=RBAC --cpus 4 --memory 4096 --vm-driver hyperv --hyperv-virtual-switch kubeswitch --extra-config=apiserver.authorization-mode=RBAC


# enable dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
