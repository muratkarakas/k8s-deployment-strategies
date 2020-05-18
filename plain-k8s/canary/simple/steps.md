# Demo script

This version uses basic k8s deployment for canary release management. Release ratio is managed by the numer of replicas.

* run ./deploy-blue.sh

* run ./curl-watch.sh in seperate shell

* run ./deploy-green-canary.sh

* check curl-watch.sh output & application UI from [http://localhost](http://localhost)

* run ./cleanup.sh
