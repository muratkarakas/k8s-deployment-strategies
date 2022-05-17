sed -i '' 's/name: green-app/name: blue-app/g' ingress.yaml

kubectl apply -f ingress.yaml