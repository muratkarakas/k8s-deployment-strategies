# Demo script

* make sure you have installed nginx-ingress (../../../ingress-install.sh)

* make sure you have installed argo-rollout  (../../install-argo-rollout.sh)

* run ./rollout-blue.sh

* Open application UI from [http://localhost](http://localhost)

* run ./rollout-green.sh (when all instances are up argo-rollout with activate it automatically )

* Monitor progress from UI [http://localhost](http://localhost)

* After successful rollout argo will perform release analysis (baseline api security scan)

* If it ends with error, rolout will be rolled backed (default/current setup of analyis step)

* Monitor progress from UI [http://localhost](http://localhost)

* run ./cleanup.sh
