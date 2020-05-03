kubectl delete  deploy blue-app
kubectl delete  deploy green-app

kubectl delete svc canary-simple

kubectl delete ingress canary-simple

kubectl delete cm nginx-configuration