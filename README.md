# minio-operator

![Version: 4.4.12-bb.3](https://img.shields.io/badge/Version-4.4.12--bb.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.4.12](https://img.shields.io/badge/AppVersion-v4.4.12-informational?style=flat-square)

A Helm chart for MinIO Operator

## Upstream References
* <https://min.io>

* <https://github.com/minio/operator>

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
| operator.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| operator.image.tag | string | `"v4.4.12"` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.imagePullSecrets | list | `[]` |  |
| operator.initcontainers | list | `[]` |  |
| operator.replicaCount | int | `1` |  |
| operator.securityContext.runAsUser | int | `1000` |  |
| operator.securityContext.runAsGroup | int | `1000` |  |
| operator.securityContext.runAsNonRoot | bool | `true` |  |
| operator.securityContext.fsGroup | int | `1000` |  |
| operator.nodeSelector | object | `{}` |  |
| operator.affinity | object | `{}` |  |
| operator.tolerations | list | `[]` |  |
| operator.topologySpreadConstraints | list | `[]` |  |
| operator.resources.requests.cpu | string | `"200m"` |  |
| operator.resources.requests.memory | string | `"256Mi"` |  |
| operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| operator.resources.limits.cpu | string | `"200m"` |  |
| operator.resources.limits.memory | string | `"256Mi"` |  |
| console.enabled | bool | `false` |  |
| console.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/console"` |  |
| console.image.tag | string | `"v0.15.5"` |  |
| console.image.pullPolicy | string | `"IfNotPresent"` |  |
| console.imagePullSecrets | list | `[]` |  |
| console.initcontainers | list | `[]` |  |
| console.replicaCount | int | `1` |  |
| console.nodeSelector | object | `{}` |  |
| console.affinity | object | `{}` |  |
| console.tolerations | list | `[]` |  |
| console.topologySpreadConstraints | list | `[]` |  |
| console.resources | object | `{}` |  |
| console.securityContext.runAsUser | int | `1000` |  |
| console.securityContext.runAsNonRoot | bool | `true` |  |
| console.ingress.enabled | bool | `false` |  |
| console.ingress.ingressClassName | string | `""` |  |
| console.ingress.labels | object | `{}` |  |
| console.ingress.annotations | object | `{}` |  |
| console.ingress.tls | list | `[]` |  |
| console.ingress.host | string | `"console.local"` |  |
| console.ingress.path | string | `"/"` |  |
| console.volumes | list | `[]` |  |
| console.volumeMounts | list | `[]` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| istio.enabled | bool | `false` |  |
| istio.mtls.mode | string | `"STRICT"` |  |
| openshift | bool | `false` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| annotations | object | `{}` |  |
| tenantPatchJob.enabled | bool | `true` |  |
| tenantPatchJob.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| tenantPatchJob.image.tag | float | `8.4` |  |
| tenantPatchJob.image.pullSecrets[0] | string | `"private-registry"` |  |
| installCRDs | bool | `true` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
