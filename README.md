# minio-operator

![Version: 5.0.12-bb.3](https://img.shields.io/badge/Version-5.0.12--bb.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v5.0.12](https://img.shields.io/badge/AppVersion-v5.0.12-informational?style=flat-square)

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
| operator.env[3].name | string | `"OPERATOR_STS_ENABLED"` |  |
| operator.env[3].value | string | `"on"` |  |
| operator.serviceAccountAnnotations | list | `[]` |  |
| operator.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| operator.image.tag | string | `"v5.0.12"` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
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
| console.enabled | bool | `false` |  |
| console.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| console.image.tag | string | `"v5.0.12"` |  |
| console.image.pullPolicy | string | `"IfNotPresent"` |  |
| console.env | list | `[]` |  |
| console.imagePullSecrets | list | `[]` |  |
| console.runtimeClassName | string | `nil` |  |
| console.initContainers | list | `[]` |  |
| console.replicaCount | int | `1` |  |
| console.nodeSelector | object | `{}` |  |
| console.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"name"` |  |
| console.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| console.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"minio-operator"` |  |
| console.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| console.tolerations | list | `[]` |  |
| console.topologySpreadConstraints | list | `[]` |  |
| console.resources.requests.cpu | float | `0.25` |  |
| console.resources.requests.memory | string | `"512Mi"` |  |
| console.securityContext.runAsUser | int | `1000` |  |
| console.securityContext.runAsGroup | int | `1000` |  |
| console.securityContext.runAsNonRoot | bool | `true` |  |
| console.containerSecurityContext.runAsUser | int | `1000` |  |
| console.containerSecurityContext.runAsGroup | int | `1000` |  |
| console.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| console.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| console.ingress.enabled | bool | `false` |  |
| console.ingress.ingressClassName | string | `""` |  |
| console.ingress.labels | object | `{}` |  |
| console.ingress.annotations | object | `{}` |  |
| console.ingress.tls | list | `[]` |  |
| console.ingress.host | string | `"console.local"` |  |
| console.ingress.path | string | `"/"` |  |
| console.ingress.pathType | string | `"Prefix"` |  |
| console.volumes[0].name | string | `"tmp"` |  |
| console.volumes[0].emptyDir | object | `{}` |  |
| console.volumeMounts[0].name | string | `"tmp"` |  |
| console.volumeMounts[0].readOnly | bool | `false` |  |
| console.volumeMounts[0].mountPath | string | `"/tmp/certs/CAs"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.tempo.enabled | bool | `false` |  |
| istio.hardened.tempo.namespaces[0] | string | `"tempo"` |  |
| istio.hardened.tempo.principals[0] | string | `"cluster.local/ns/tempo/sa/tempo-tempo"` |  |
| istio.mtls.mode | string | `"STRICT"` |  |
| istio.console.enabled | bool | `true` |  |
| istio.console.annotations | object | `{}` |  |
| istio.console.labels | object | `{}` |  |
| istio.console.gateways[0] | string | `"istio-system/main"` |  |
| istio.console.hosts[0] | string | `"minio-operator-console.{{ .Values.domain }}"` |  |
| istio.console.service | string | `""` |  |
| istio.console.port | string | `""` |  |
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
| bbtests.cypress.resources.requests.cpu | string | `"1"` |  |
| bbtests.cypress.resources.requests.memory | string | `"1Gi"` |  |
| bbtests.cypress.resources.limits.cpu | string | `"2"` |  |
| bbtests.cypress.resources.limits.memory | string | `"2Gi"` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://console.minio-operator.svc.cluster.local:9090"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
