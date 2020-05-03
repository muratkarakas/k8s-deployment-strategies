sed -i '' 's/rollouts-demo:blue/rollouts-demo:green/g' rollout.yaml

kubectl apply -f ingress.yaml
kubectl apply -f rollout.yaml
