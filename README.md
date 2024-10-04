<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# minio-operator

![Version: 6.0.3-bb.1](https://img.shields.io/badge/Version-6.0.3--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v6.0.3](https://img.shields.io/badge/AppVersion-v6.0.3-informational?style=flat-square)

A Helm chart for MinIO Operator

## Upstream References
* <https://min.io>

* <https://github.com/minio/operator>

### Upstream Release Notes

This package has no upstream release note links on file. Please add some to [chart/Chart.yaml](chart/Chart.yaml) under `annotations.bigbang.dev/upstreamReleaseNotesMarkdown`.
Example:
```yaml
annotations:
  bigbang.dev/upstreamReleaseNotesMarkdown: |
    - [Find our upstream chart's CHANGELOG here](https://link-goes-here/CHANGELOG.md)
    - [and our upstream application release notes here](https://another-link-here/RELEASE_NOTES.md)
```

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install minio-operator chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| operator.env[0].name | string | `"MINIO_OPERATOR_TLS_ENABLE"` |  |
| operator.env[0].value | string | `"on"` |  |
| operator.env[1].name | string | `"CLUSTER_DOMAIN"` |  |
| operator.env[1].value | string | `"cluster.local"` |  |
| operator.env[2].name | string | `"WATCHED_NAMESPACE"` |  |
| operator.env[2].value | string | `""` |  |
| operator.env[3].name | string | `"OPERATOR_STS_ENABLED"` |  |
| operator.env[3].value | string | `"on"` |  |
| operator.serviceAccountAnnotations | list | `[]` |  |
| operator.additionalLabels | object | `{}` |  |
| operator.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| operator.image.tag | string | `"v6.0.3"` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.sidecarImage.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator-sidecar"` |  |
| operator.sidecarImage.tag | string | `"v6.0.2"` |  |
| operator.sidecarImage.digest | string | `""` |  |
| operator.sidecarImage.pullPolicy | string | `"IfNotPresent"` |  |
| operator.imagePullSecrets | list | `[]` |  |
| operator.runtimeClassName | string | `nil` |  |
| operator.initContainers | list | `[]` |  |
| operator.replicaCount | int | `2` |  |
| operator.securityContext.runAsUser | int | `1000` |  |
| operator.securityContext.runAsGroup | int | `1000` |  |
| operator.securityContext.runAsNonRoot | bool | `true` |  |
| operator.securityContext.fsGroup | int | `1000` |  |
| operator.containerSecurityContext.runAsUser | int | `1000` |  |
| operator.containerSecurityContext.runAsGroup | int | `1000` |  |
| operator.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| operator.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| operator.volumes | list | `[]` |  |
| operator.volumeMounts | list | `[]` |  |
| operator.nodeSelector | object | `{}` |  |
| operator.priorityClassName | string | `""` |  |
| operator.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"name"` |  |
| operator.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| operator.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"minio-operator"` |  |
| operator.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| operator.tolerations | list | `[]` |  |
| operator.topologySpreadConstraints | list | `[]` |  |
| operator.resources.requests.cpu | string | `"200m"` |  |
| operator.resources.requests.memory | string | `"256Mi"` |  |
| operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| operator.resources.limits.cpu | string | `"200m"` |  |
| operator.resources.limits.memory | string | `"256Mi"` |  |
| operator.podLabels | object | `{}` | Labels for operator pod(s) |
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
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
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

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

