# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [5.0.15-bb.1] - 2024-06-28

### Upgrade 

- Upgrade MinIO Tenant CRD to 5.0.15

## [5.0.15-bb.0] - 2024-05-09

### Upgrade

- ironbank/opensource/minio/operator v5.0.14 -> v5.0.15
- registry1.dso.mil/ironbank/opensource/minio/operator v5.0.14 -> v5.0.15

## [5.0.14-bb.2] - 2024-04-09

### Added

- Added custom network polices

## [5.0.14-bb.1] - 2024-04-02

### Changed

- Added Istio Sidecar to restrict egress traffic to REGISTRY_ONLY
- Added Istio ServiceEntry to explicitly allow egress

## [5.0.14-bb.0] - 2024-03-20

### Upgrade

- ironbank/opensource/minio/operator v5.0.13 -> v5.0.14
- registry1.dso.mil/ironbank/opensource/minio/operator v5.0.13 -> v5.0.14

## [5.0.13-bb.0] - 2024-03-15

### Upgrade

- ironbank/opensource/minio/operator v5.0.12 -> v5.0.13
- registry1.dso.mil/ironbank/opensource/minio/operator v5.0.12 -> v5.0.13

## [5.0.12-bb.4] - 2024-03-15

### Upgrade

- fixing and updating the minio authz policy

## [5.0.12-bb.3] - 2024-03-11

### Upgrade

- Openshift update for deploying Minio-Operator into Openshift cluster

## [5.0.12-bb.2] - 2024-03-07

### Added

- Added runAsGroup
- Added allow-helm-test-egress NetworkPolicy

### Changed

- Change to use kubernetes.io/metadata.name for test NetworkPolicy to get fixed namespace name

## [5.0.12-bb.1] - 2024-02-27

### Upgrade

- Added cypress test

## [5.0.12-bb.0] - 2024-02-13

### Upgrade

- ironbank/opensource/minio/operator v5.0.11 -> v5.0.12
- registry1.dso.mil/ironbank/opensource/minio/operator v5.0.11 -> v5.0.12

## [5.0.11-bb.2] - 2024-02-09

### Upgrade

- Create authorization policy for minio namespace
- fix authorization policy for ingress gateways

## [5.0.11-bb.1] - 2023-12-20

### Upgrade

- Create a VirtualService and supporting NetworkPolicies / AuthorizationPolicies to expose the `console` UI if desired

## [5.0.11-bb.0] - 2023-12-05

### Upgrade

- Upgraded minio operator chart to v5.0.11
- Upgrade minio operator images to v5.0.11
- Update to run as user 1000 to align with upstream chart

## [5.0.10-bb.1] - 2023-11-07

### Upgrade

- Updgraded BB base version to 2.1.0

## [5.0.10-bb.0] - 2023-10-17

### Upgrade

- Updated Minio Operator Helm Chart to v5.0.10

## [5.0.9-bb.0]

### Upgrade

- Update console to version v0.30.0
- Updated Minio Operator Helm Chart to v5.0.9

## [5.0.5-bb.0] - 2023-06-21

### Upgrade

- Update console to version v0.30.0
- Updated Minio Operator Helm Chart to v5.0.5

## [5.0.4-bb.2] - 2023-05-11

### Changed

- Updated minio console to 0.26.4

## [5.0.4-bb.1] - 2023-05-03

### Fix

- Bug fix
- Image user is 1001 in IronBank. Chart must run as user 1001 container enters crash loop

## [5.0.4-bb.0] - 2023-05-03

### Fix

- Update console to version v0.26.0
- Updated Minio Operator Helm Chart to v5.0.4

## [5.0.3-bb.0] - 2023-04-05

### Fix

- Updated Minio Operator Helm Chart to v5.0.3

## [4.5.8-bb.1] - 2023-03-24

### Fix

- Updated Minio Operator Helm Chart security context values
- Update console to version v0.25.0

## [4.5.8-bb.0] - 2023-02-03

### Upgrade

- Updated Minio Operator Helm Chart to Version 4.5.8
- Updated Operator Image to v4.5.8
- Updated Console Image to v0.23.0

## [4.5.4-bb.0] - 2022-11-28

### Upgrade

- Updated Minio Operator Helm Chart to Version 4.5.4
- Updated Operator Image to v4.5.4
- Updated Console Image to v0.21.3

## [4.5.3-bb.0] - 2022-10-31

### Upgrade

- Updated Minio Operator Helm Chart to Version 4.5.3
- Updated Minio CRD to Version 4.5.3
- Updated Operator Image to v4.5.3
- Updated Console Image to v0.21.1

## [4.4.1-bb.0] - 2022-10-04

### Upgrade

- Updated Minio Operator Helm Chart to Version 4.5.1
- Updated Minio CRD to Version 4.5.1
- Updated Operator Image to v4.5.1
- Updated Console Image to v0.20.4

## [4.4.28-bb.2] - 2022-09-20

### Upgrade

- Add capabilities drop ALL

## [4.4.28-bb.1] - 2022-09-06

### Upgrade

- Update console image to latest ironbank version

## [4.4.28-bb.0] - 2022-08-20

### Upgrade

- Update to 4.4.28
- Reconcile use of ImagePullSecrets with upstream

## [4.4.25-bb.0] - 2022-07-01

### Upgrade

- Update to 4.4.25

## [4.4.16-bb.3] - 2022-06-28

### Updated

- Updated bb base image to 2.0.0
- Disabled tenant job by default (no longer needed)

## [4.4.16-bb.2] - 2022-06-17

### Updated

- Updated tests/images.txt to have the correct console image version
- Updated renovate config to track the tests/images.txt file

## [4.4.16-bb.1] - 2022-06-16

### Updated

- Updated BB base image to 1.17.0

## [4.4.16-bb.0] - 2022-04-22

### Upgrade

- Update to 4.4.16

## [4.4.12-bb.3] - 2022-04-22

### Added

- Added STRICT mTLS policy

## [4.4.12-bb.2] - 2022-04-04

### Added

- Added newline to images.txt

## [4.4.12-bb.1] - 2022-03-30

### Added

- Added Tempo Zipkin Egress Policy

## [4.4.12-bb.0] - 2022-03-30

### Changed

- Update to 4.4.12
  
## [4.4.10-bb.1] - 2022-02-28

### Changed

- Moved CRDs back to a subchart

## [4.4.10-bb.0] - 2022-02-22

### Changed

- Update to 4.4.10
- Markdown linting and spell checking.

## [4.4.3-bb.2]  - 2022-02-03

### Changed

- Changed patch to handle tenants in all namespaces

## [4.4.3-bb.1]  - 2022-01-31

### Updated

- Chart.yaml to follow new standardization for release automation
- renovate check to update new standardization

## [4.4.3-bb.0]  - 2022-01-24

### Added

- upstream console charts with logic to enable/disable -- disabled by default

### Changed

- Update to 4.4.3 -- upstream charts now split on operator/tenant charts -- kpt is used now

### Removed

- The upstream directory containing the upstream git source code

## [4.2.3-bb.4]  - 2021-12-28

### Changed

- remove extra Image Pull Secret definition under operator field

## [4.2.3-bb.3] - 2021-11-22

### Changed

- remove extra Image Pull Secret definition under operator field

## [4.2.3-bb.2] - 2021-09-29

### Changed

- Added networkPolicy for egress to instance

## [4.2.3-bb.1] - 2021-10-09  

### Changed

- hardcoded service account name

## [4.2.3-bb.0] - 2021-09-09

### Changed

- Upgraded Minio Operator to Version 4.2.3
- Upgraded Minio Helm Chart to version 4.2.3

## [4.1.2-bb.3] - 2021-08-26

### Changed

- Added istio sidecar scraping network policy

## [4.1.2-bb.2] - 2021-08-18  

### Changed

- Added resource requests and limits to the Minio Operator

## [4.1.2-bb.1] - 2021-07-21

### Upgrade to 4.12

- Upgraded Minio Operator to Version 4.1.2
- Upgraded Minio Helm Chart to version 4.1.2
- Added NetworkPolicy objects to control/limit network access for Minio Operator
- Kpt update of upstream folder to contain the 4.1.2 upstream release source from github
- Added Openshift DNS access support to network policy

## [4.0.4-bb.1] - 2021-04-29

### Upgrade to 4.0.3

- Upgraded Operator to Version 4.0.3.  CRD now uses "tenants" instead of "miniinstances"
- New operator has substantially more tuning knobs for tenants

## [2.0.9-bb.3] - 2021-04-13  

### Changed

- Added ability to pass affinity and nodeselector to helm chart
- Added affinity documentation

## [1.0.0]  - 2021-01-21

### Changed

- Created Helm wrap for deployment of the operator
- Added imagepullsecret to the deployment
