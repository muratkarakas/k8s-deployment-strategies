kubectl delete  deploy blue-app
kubectl delete  deploy green-app

kubectl delete svc blue-app

kubectl delete svc green-app

kubectl delete ingress blue-ingress

kubectl delete ingress canary

kubectl delete cm nginx-configuration