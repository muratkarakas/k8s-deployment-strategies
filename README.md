%title: Deployment Strategies with Kubernetes
%author: Murat Karakaş
%date: YYYY-MM-DD

-> # Road Map  <-

* Basics Of Kubernetes Deployment
* Common Strategies
* Introduction ArgoRollout
* Demo
  * Plain K8s
  * Automated with ArgoRollout

---
-> ## Basics  <-

* A Pod  is a group of one or more containers. Simplest application unit.

* ReplicaSet is used for managing identical set of pods working together and guarantees availibilty.

* ReplicaSet is not declarative

* Deployment is higher-level concept over ReplicaSet that provides declarative update,rollback

---

```java


                                   +-----------------------------+
                                   |         Deployment          |
                                   +--------------+--------------+
                                                  |
                                  /--------------/ \--------------\
                                  |                               |
                                  |                               |
                                  |                               |
                                  v                               v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  ReplicaSet  |                     |  ReplicaSet  |
                        |              |                     |              |
                        +------+-------+                     +-------+------+
                               |                                     |
                    /---------/ \---------\               /---------/ \---------\
                   |                       |             |                       |
                   |                       |             |                       |
                   |                       |             |                       |
                   v                       v             v                       v
               +-----------+      +-----------+       +-----------+      +-----------+
               |           |      |           |       |           |      |           |
               |    Pod    |      |    Pod    |       |    Pod    |      |    Pod    |
               |           |      |           |       |           |      |           |
               +-----------+      +-----------+       +-----------+      +-----------+

```

---

-> ## Common Strategies  <-

* Rolling Update

* ReCreate

* Blue/Green

* Canary

There strategies are not specific to k8s

---

-> ## Rolling Update <-

Think that you have 3 instances of your application (3 pods)

* Update your deployment definition with new Image

* Deployment wil start new pod from new image(based on your rules)

* After new pod starts, one of the old pod is delete

* This process continues until there are no running old pods left

* Techically there is no downtime

---

-> ## ReCreate <-

Think that again you have 3 instances of your application (3 pods)

* Update your deployment definition with new Image

* Deployment wil terminate all old pods

* After termination process finishes creates  3 pods from new image

* Your application won't be availibile during this process

---

-> ## Blue-Green Deployment <-

* Blue refers to currenttly running version of your application

* Green is the new version of your application

* If you have 3 pods (which are called blue ones) you start 3 green instances

* External Load balancer routes to only  blue ones

* When you have 3 healty green instances you test your new instances

* If there is no problem with the green instances you switch your load balancer to point the green instances only

* Scale your blue instances 0 for fast rollback

---
-> ## Blue-Green Deployment <-

```java

                                             Web Traffic
                                                 |
                                                 |
                                                 |
                                                 |
                                                 v
                                   +-----------------------------+
                                   |         Load Balancer       |
                                   +--------------+--------------+
                                        %100       |
                                  /--------------/
                                  |
                                  |
                                  |
                                  v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  Old Version |                     |  New Version | ----> check internally
                        |              |                     |              |
                        +------+-------+                     +-------+------+


```

---
-> ## Blue-Green Deployment <-

```java

                                             Web Traffic
                                                 |
                                                 |
                                                 |
                                                 |
                                                 v
                                   +-----------------------------+
                                   |         Load Balancer       |
                                   +--------------+--------------+
                                                  |  switch traffic
                                                   \--------------\
                                                                  |
                                                                  |
                                                                  |
                                                                  v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  Old Version |                     |  New Version |
                        |              |                     |              |
                        +------+-------+                     +-------+------+


```

---
-> ## Canary Release <-

“Canary release* is a technique to reduce the risk of introducing a new software version in
production by slowly rolling out the change to a small subset of users before rolling it out to
the entire infrastructure and making it available to everybody.”

*https://martinfowler.com/bliki/CanaryRelease.html

---

-> ## Canary Release <-

* Deploy the new version of your application
* Don't stop or scale down old version
* Forward limited traffic to new version(ex:%10)
* Alternatively release new version to limited set of users
* Check the results
* Increase the trafic ratio of new version step by step

---
-> ## Canary Release <-

```java

                                             Web Traffic
                                                 |
                                                 |
                                                 |
                                                 |
                                                 v
                                   +-----------------------------+
                                   |         Load Balancer       |
                                   +--------------+--------------+
                                        %90       |      %10
                                  /--------------/ \--------------\
                                  |                               |
                                  |                               |
                                  |                               |
                                  v                               v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  Old Version |                     |  New Version |
                        |              |                     |              |
                        +------+-------+                     +-------+------+


```

---
-> ## Canary Release <-

```java

                                             Web Traffic
                                                 |
                                                 |
                                                 |
                                                 |
                                                 v
                                   +-----------------------------+
                                   |         Load Balancer       |
                                   +--------------+--------------+
                               Normal Users       |         Test Users
                                  /--------------/ \--------------\
                                  |                               |
                                  |                               |
                                  |                               |
                                  v                               v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  Old Version |                     |  New Version |
                        |              |                     |              |
                        +------+-------+                     +-------+------+


```

---
-> ## Canary Release <-

```java
                                             Web Traffic
                                                 |
                                                 |
                                                 |
                                                 |
                                                 v
                                   +-----------------------------+
                                   |         Load Balancer       |
                                   +--------------+--------------+
                                                  |      All Users  100% Traffic
                                  /------X-------/ \--------------\
                                  |                               |
                                  |                               |
                                  |                               |
                                  v                               v
                        +--------------+                     +--------------+
                        |              |                     |              |
                        |  Old Version |                     |  New Version |
                        |              |                     |              |
                        +------+-------+                     +-------+------+


```

---

-> ## Applying  Strategies with Kubernetes <-

* Supports all these major strategies out of the box
* Deployment + Service + Ingress
* Requires applying practices
* User controlled flow

-> ## Argo Rolluts <-

* Argo Rollouts provides deployment strategies such as Blue Green and Canary to Kubernetes with automates process.

* Has built in controller name "ArgoRollout" which  has advanced controlls compared to classic k8s "Deployment".

* Uses direct kubernetes load balancer features (Service & Ingress ). No additional networking components.

* Supports automated release analysis (Post or Progressive)

* Has kubectl plugin for commandline

-> ## Demo <-

* Plain K8s
  * Blue/Green
  * Canary

* Automated with ArgoRollout
  * Blue/Green
  * Canary
  * Blue/Green with autmatic rollback with analysis
