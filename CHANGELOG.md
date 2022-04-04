# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

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
