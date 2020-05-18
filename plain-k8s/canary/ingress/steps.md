# Demo script

This version uses nginx-ingress for canary release management. Release ratio is managed ingress configuration.

* run ./deploy-blue.sh

* Open your hosts file '/etc/host' file and add '127.0.0.1  canary.local' entry in it( It is required for nginx-ingress canary)

* Open application UI from [http://canary.local](http://canary.local) and wait for blue traffic

* run ./deploy-green-canary.sh . You can change  canary release ration in ingress-canary.yml file.

* Monitor application traffic  from [http://canary.local](http://canary.local)

* run ./cleanup.sh
