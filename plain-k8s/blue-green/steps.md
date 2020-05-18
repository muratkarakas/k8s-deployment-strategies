# Demo script

* make sure you have installed nginx-ingress (../../ingress-install.sh)
* run ./deploy-blue.sh
* run ./deploy-green.sh
* run ./curl-watch.sh in seperate shell
* Wait for new version to be available
* run ./switch-to-green.sh
* check curl-watch.sh output & application UI from [http://localhost](http://localhost)
* run ./cleanup.sh
