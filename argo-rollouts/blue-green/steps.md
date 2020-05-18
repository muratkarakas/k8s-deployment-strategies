# Demo script

* make sure you have installed nginx-ingress (../../ingress-install.sh)

* make sure you have installed argo-rollout  (../install-argo-rollout.sh)

* run ./rollout-blue.sh

* Open application UI from [http://localhost](http://localhost)

* run ./rollout-green.sh (when all instances are up argo-rollout with activate it automatically )

* Monitor blue/green switch from UI [http://localhost](http://localhost)

* After successful rollout blue app will ve destroyed in 120 seconds

* run ./cleanup.sh
