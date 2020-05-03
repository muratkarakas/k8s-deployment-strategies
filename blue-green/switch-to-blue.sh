sed -i '' 's/serviceName: green-app/serviceName: blue-app/g' ingress.yaml

kubectl apply -f ingress.yaml