# Demo script

* make sure you have installed nginx-ingress (../../ingress-install.sh)

* make sure you have installed argo-rollout  (../install-argo-rollout.sh)

* run ./rollout-blue.sh

* Open application UI from [http://canary.local](http:///canary.local)

* run ./rollout-green.sh

* Argo rollout will activate green app with %10 trafic

* In every 1 minute it will increase the green app load up to %100 ( 10% => 25% =>  50% => 100% )

* After successful rollout argo rollout will terminate old version(blue).

* Monitor blue/green switch from UI [http://canary.local](http://canary.local)

* run ./cleanup.sh
