# How to Upgrade Minio Operator Package

1.  Sync with new chart. This can be done with kpt or meld:
    `kpt pkg update chart/@{TAG} --strategy alpha-git-patch`
    or
    `kpt pkg update chart/@{TAG} --strategy force-delete-replace`
    or Meld UI
    1. Move `minio.min.io_tenants.yaml` to `minio-operator-crds/templates/`
    2. Update `minio-operator-crds/Chart.yaml` with new version
    3. Update `chart/Chart.yaml` dependency version
    4. Rebuild dependency .tgz:
       `export HELM_EXPERIMENTAL_OCI=1`
       `helm dependency update chart`
2.  Update version references for the Chart in chart/Chart.yaml. versionshould be-bb.0(ex:1.14.3-bb.0) and appVersion should be(ex:1.14.3). Also validate that the BB annotation for the main Minio version is updated (leave the Tetrate version as-is unless you are updating those images).
3.  Verify that chart/values.yaml tag and tidTAG have been updated to the new version.
4.  Add a changelog entry for the update. At minimum mention updating the image versions.
5.  Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).
6.  Open an MR in "Draft" status (or check the one that Renovate creates for the issue) and validate that CI passes. This will perform a number of smoke tests against the package, but it is good to manually deploy to test some things that CI doesn't. Follow the steps below for manual testing.
7.  Once all manual testing is complete take your MR out of "Draft" status, add the review label, add any necessary upgrade notices (if none you will need to put N/A), add any screenshots/logs/etc. as proof that your changes work (these are required), assign yourself as the assignee, and add reviewers.

# Testing new Minio Operator version

## Cluster setup

⚠️ Always make sure your local bigbang repo is current before deploying.

1. Export your Ironbank/Harbor credentials (this can be done in your `~/.bashrc` or `~/.zshrc` file if desired). These specific variables are expected by the `k3d-dev.sh` script when deploying metallb, and are referenced in other commands for consistency:
   ```
   export REGISTRY_USERNAME='<your_username>'
   export REGISTRY_PASSWORD='<your_password>'
   ```
1. Export the path to your local bigbang repo (without a trailing `/`):

   ⚠️ Note that wrapping your file path in quotes when exporting will break expansion of `~`.

   ```
   export BIGBANG_REPO_DIR=<absolute_path_to_local_bigbang_repo>
   ```

   e.g.

   ```
   export BIGBANG_REPO_DIR=~/repos/bigbang
   ```

1. Run the [k3d_dev.sh](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/assets/scripts/developer/k3d-dev.sh) script to deploy a dev cluster (`-a` flag required if deploying a local Keycloak):

   ```
   "${BIGBANG_REPO_DIR}/docs/assets/scripts/developer/k3d-dev.sh"
   ```

1. Export your kubeconfig:

   ```
   export KUBECONFIG=~/.kube/<your_kubeconfig_file>
   ```

   e.g.

   ```
   export KUBECONFIG=~/.kube/Sam.Sarnowski-dev-config
   ```

1. [Deploy flux to your cluster](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/scripts/install_flux.sh):
   ```
   "${BIGBANG_REPO_DIR}/scripts/install_flux.sh -u ${REGISTRY_USERNAME} -p ${REGISTRY_PASSWORD}"
   ```

## Deploy Bigbang

⚠️ Note that testing against your local branch or tag is only possible if you edit the overrides file to point to your changes.

From the root of this repo, run the following deploy command :

```sh
helm upgrade -i bigbang ${BIGBANG_REPO_DIR}/chart/ -n bigbang --create-namespace \
--set registryCredentials.username=${REGISTRY_USERNAME} --set registryCredentials.password=${REGISTRY_PASSWORD} \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/tests/test-values.yaml \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/chart/ingress-certs.yaml \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/docs/assets/configs/example/dev-sso-values.yaml \
-f docs/dev-overrides/minimal.yaml \
-f docs/dev-overrides/minio-operator-testing.yaml
```

## Big bang Integration Testing

As part of your MR that modifies bigbang packages, you should modify the bigbang [bigbang/tests/test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads) against your branch for the CI/CD MR testing by enabling your packages.

To do this, at a minimum, you will need to follow the instructions at [bigbang/docs/developer/test-package-against-bb.md](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) with changes for Minio Operator enabled (the below is a reference, actual changes could be more depending on what changes where made to Minio Operator in the package MR).

    ```yaml
    addons:
      minioOperator:
        enabled: true
        git:
          tag: null
          branch: <my-package-branch-that-needs-testing>
        values:
          istio:
            hardened:
              enabled: true
      ### Additional compononents of Minio Operator should be changed to reflect testing changes introduced in the package MR
    ```

## Local install

1. Clean install:
   install minio-operator and minio from your branch.
1. Upgrade:
   install current versions of minio-operator and minio, and upgrade to your branch. Ensure both minio-operator and minio have upgraded to the newer versions.

Pipeline:
modify [MinIO](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio/-/blob/main/tests/dependencies.yaml) package dependency to point to your branch/version and create an MR

# Modifications made to upstream chart

This is a high-level list of modifitations that Big Bang has made to the upstream helm chart. You can use this as as cross-check to make sure that no modifications were lost during the upgrade process.

## When performing the helm update the following items should be maintained.

1. In chart/templates/\_helpers.tpl; maintain the folowing function:

```
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
\*/}}
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

## chart/values.yaml

- Bigbang additions at the end of the file
- images to ironbank

## chart/templates/bigbang/\*

- networkpolicies/\*
- minio-operaotor-exception.yaml
- peer-authentication.yaml
- tenant-patch-job.yaml

## chart/minio-operator-crds/\*

- Bigbang moves the operator crd to this location to build the tgz

## chart/charts/\*.tgz

- run `helm dependency update ./chart` and commit the downloaded archives

- commit the tar archives that were downloaded from the helm dependency update command. And also commit the requirements.lock that was generated.

# Files that need integration testing

If you modify any of these things, you should perform an integration test with your branch against the rest of bigbang. Some of these files have automatic tests already defined, but those automatic tests may not model corner cases found in full integration scenarios.

- `./chart/templates/*`
- `./chart/templates/bigbang/*`
- `./chart/values.yaml` if it involves any of:
  - monitoring changes
  - network policy changes
  - kyverno policy changes
  - istio hardening rule changes
  - service definition changes
  - TLS settings
  - server ingress settings
  - headless server settings (especially port or other comms settings)

Follow [the standard process](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) for performing an integration test against bigbang.

## automountServiceAccountToken

The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.
