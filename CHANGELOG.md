# Minio Operator

* 4.1.2-bb.1 (7/21/21)
  * Upgraded Minio Operator to Version 4.1.2
  * Upgraded Minio Helm Chart to version 4.1.2
  * Added NetworkPolicy objects to control/limit network access for Minio Operator

* 4.0.4-bb.1 (4/29/2021)
  * Upgraded Operator to Version 4.0.3.  CRD now uses "tenats" instaned of "miniinstances"
  * New operator has substantially more tuning knobs for tenants

* 2.0.9-bb.3 (04/13/2021)
 * Added ability to pass affinity and nodeselector to helm chart
 * Added affinity documentation

* 1.0.0 (01/21/2021)
  * Created Helm wrap for deployment of the operator
  * Added imagepullsecret to the deployment


