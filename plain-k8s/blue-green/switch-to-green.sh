sed -i '' 's/serviceName: blue-app/serviceName: green-app/g' ingress.yaml

kubectl apply -f ingress.yaml