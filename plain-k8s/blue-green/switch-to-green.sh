sed -i '' 's/name: blue-app/name: green-app/g' ingress.yaml

kubectl apply -f ingress.yaml