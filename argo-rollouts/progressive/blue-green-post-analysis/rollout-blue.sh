sed -i '' 's/rollouts-demo:green/rollouts-demo:blue/g' rollout.yaml

kubectl apply -f ingress.yaml
kubectl apply -f rollout.yaml
kubectl apply -f analysis-template.yaml
