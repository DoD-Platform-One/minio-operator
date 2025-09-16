<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# minio-operator

![Version: 7.1.1-bb.1](https://img.shields.io/badge/Version-7.1.1--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v7.1.1](https://img.shields.io/badge/AppVersion-v7.1.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

A Helm chart for MinIO Operator

## Upstream References

- <https://min.io>
- <https://github.com/minio/operator>

## Upstream Release Notes

This package has no upstream release note links on file. Please add some to [chart/Chart.yaml](chart/Chart.yaml) under `annotations.bigbang.dev/upstreamReleaseNotesMarkdown`.
Example:
```yaml
annotations:
  bigbang.dev/upstreamReleaseNotesMarkdown: |
    - [Find our upstream chart's CHANGELOG here](https://link-goes-here/CHANGELOG.md)
    - [and our upstream application release notes here](https://another-link-here/RELEASE_NOTES.md)
```

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install minio-operator chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.hardened.tempo.enabled | bool | `false` |  |
| istio.hardened.tempo.namespaces[0] | string | `"tempo"` |  |
| istio.hardened.tempo.principals[0] | string | `"cluster.local/ns/tempo/sa/tempo-tempo"` |  |
| istio.hardened.minio.enabled | bool | `true` |  |
| istio.hardened.minio.namespaces[0] | string | `"minio"` |  |
| istio.hardened.minio.principals[0] | string | `"cluster.local/ns/minio/sa/minio-minio-minio-instance-sa"` |  |
| istio.mtls.mode | string | `"STRICT"` |  |
| openshift | bool | `false` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| annotations | object | `{}` |  |
| tenantPatchJob.enabled | bool | `false` |  |
| tenantPatchJob.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| tenantPatchJob.image.tag | string | `"2.1.0"` |  |
| tenantPatchJob.image.pullSecrets[0] | string | `"private-registry"` |  |
| installCRDs | bool | `true` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.resources.requests.cpu | string | `"2"` |  |
| bbtests.cypress.resources.requests.memory | string | `"4Gi"` |  |
| bbtests.cypress.resources.limits.cpu | string | `"2"` |  |
| bbtests.cypress.resources.limits.memory | string | `"4Gi"` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://console.minio-operator.svc.cluster.local:9090"` |  |
| upstream.nameOverride | string | `"minio-operator"` |  |
| upstream.operator.env[0].name | string | `"MINIO_OPERATOR_TLS_ENABLE"` |  |
| upstream.operator.env[0].value | string | `"on"` |  |
| upstream.operator.env[1].name | string | `"CLUSTER_DOMAIN"` |  |
| upstream.operator.env[1].value | string | `"cluster.local"` |  |
| upstream.operator.env[2].name | string | `"WATCHED_NAMESPACE"` |  |
| upstream.operator.env[2].value | string | `""` |  |
| upstream.operator.env[3].name | string | `"OPERATOR_STS_ENABLED"` |  |
| upstream.operator.env[3].value | string | `"on"` |  |
| upstream.operator.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| upstream.operator.image.tag | string | `"v7.1.1"` |  |
| upstream.operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.operator.sidecarImage.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator-sidecar"` |  |
| upstream.operator.sidecarImage.tag | string | `"v7.0.1"` |  |
| upstream.operator.sidecarImage.digest | string | `""` |  |
| upstream.operator.sidecarImage.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.operator.imagePullSecrets | list | `[]` |  |
| upstream.operator.runtimeClassName | string | `nil` |  |
| upstream.operator.resources.requests.cpu | string | `"200m"` |  |
| upstream.operator.resources.requests.memory | string | `"256Mi"` |  |
| upstream.operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| upstream.operator.resources.limits.cpu | string | `"200m"` |  |
| upstream.operator.resources.limits.memory | string | `"256Mi"` |  |
| upstream.operator.podLabels | object | `{}` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md).

