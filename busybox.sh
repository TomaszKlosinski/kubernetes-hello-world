#On most providers, the pod IPs are not externally accessible. The easiest way to test that the pod is working is to create a busybox pod and exec commands on it remotely. See the command execution documentation for details.

#Provided the pod IP is accessible, you should be able to access its http endpoint with wget on port 80:

kubectl run busybox --image=busybox --restart=Never --tty -i --generator=run-pod/v1 --env "POD_IP=$(kubectl get pod nginx -o go-template='{{.status.podIP}}')"

#$ wget -qO- http://$POD_IP # Run in the busybox container
#$ exit # Exit the busybox container

#kubectl delete pod busybox # Clean up the pod we created with "kubectl run"

