# How to upgrade

 1. Sync with new chart. This can be done with kpt or meld:
 `kpt pkg update chart/@{TAG} --strategy alpha-git-patch`
 or
 `kpt pkg update chart/@{TAG} --strategy force-delete-replace`
 or
 Meld UI
 1. Move `minio.min.io_tenants.yaml` to `minio-operator-crds/templates/`
 1. Update `minio-operator-crds/Chart.yaml` with new version
 1. Update `chart/Chart.yaml` dependency version
 1. Rebuild dependency .tgz:
 `export HELM_EXPERIMENTAL_OCI=1`
 `helm dependency update chart`

# How to test the upgrade
Local install:
1. Clean install:
install minio-operator and minio from your branch.
1. Upgrade:
install current versions of minio-operator and minio, and upgrade to your branch. Ensure both minio-operator and minio have upgraded to the newer versions.

Pipeline:
modify [MinIO](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio/-/blob/main/tests/dependencies.yaml) package dependency to point to your branch/version and create an MR

# automountServiceAccountToken
The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.

# Modifications made to upstream chart
This is a high-level list of modifitations that Big Bang has made to the upstream helm chart. You can use this as as cross-check to make sure that no modifications were lost during the upgrade process.

## When performing the helm update the following items should be maintained.
1. In chart/templates/_helpers.tpl; maintain the folowing function:
```
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minio-operator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}
```
1. if there is a version of minio.min.io_tenants.yaml in the chart/templates, this file should be moved to the minio package if the kpt update does not do it automatically.
1. in chart/templates/serviceaccount.yaml: maintain the conditionals around the service account creation.

##  chart/values.yaml
- Bigbang additions at the end of the file
- images to ironbank

## chart/templates/bigbang/*
- networkpolicies/*
- minio-operaotor-exception.yaml
- peer-authentication.yaml
- tenant-patch-job.yaml

## chart/minio-operator-crds/*
- Bigbang moves the operator crd to this location to build the tgz

##  chart/charts/*.tgz
- run ```helm dependency update ./chart``` and commit the downloaded archives

- commit the tar archives that were downloaded from the helm dependency update command. And also commit the requirements.lock that was generated.

# Files that need integration testing

If you modify any of these things, you should perform an integration test with your branch against the rest of bigbang. Some of these files have automatic tests already defined, but those automatic tests may not model corner cases found in full integration scenarios.

* `./chart/templates/*`
* `./chart/templates/bigbang/*`
* `./chart/values.yaml` if it involves any of:
  * monitoring changes
  * network policy changes
  * kyverno policy changes
  * istio hardening rule changes
  * service definition changes
  * TLS settings
  * server ingress settings
  * headless server settings (especially port or other comms settings)

Follow [the standard process](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) for performing an integration test against bigbang.