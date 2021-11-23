# minio-operator

![Version: 4.2.3-bb.3](https://img.shields.io/badge/Version-4.2.3--bb.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.2.3](https://img.shields.io/badge/AppVersion-v4.2.3-informational?style=flat-square)

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
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| istio.enabled | bool | `false` |  |
| openshift | bool | `false` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| operator.env[0].name | string | `"CLUSTER_DOMAIN"` |  |
| operator.env[0].value | string | `"cluster.local"` |  |
| operator.env[1].name | string | `"WATCHED_NAMESPACE"` |  |
| operator.env[1].value | string | `""` |  |
| operator.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/operator"` |  |
| operator.image.tag | string | `"v4.2.3"` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.initcontainers | list | `[]` |  |
| operator.replicaCount | int | `1` |  |
| operator.securityContext.runAsUser | int | `1000` |  |
| operator.securityContext.runAsGroup | int | `1000` |  |
| operator.securityContext.runAsNonRoot | bool | `true` |  |
| operator.securityContext.fsGroup | int | `1000` |  |
| operator.nodeSelector | object | `{}` |  |
| operator.affinity | object | `{}` |  |
| operator.tolerations | list | `[]` |  |
| operator.resources.requests.cpu | string | `"200m"` |  |
| operator.resources.requests.memory | string | `"256Mi"` |  |
| operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| operator.resources.limits.cpu | string | `"200m"` |  |
| operator.resources.limits.memory | string | `"256Mi"` |  |
| imagePullSecrets | list | `[]` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| nodeSelector | object | `{}` |  |
| affinity | object | `{}` |  |
| tolerations | list | `[]` |  |
| console.image.repository | string | `"minio/console"` |  |
| console.image.tag | string | `"v0.6.3"` |  |
| console.image.pullPolicy | string | `"IfNotPresent"` |  |
| console.replicaCount | int | `1` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
# minio-operator

![Version: 4.1.5](https://img.shields.io/badge/Version-4.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.1.2](https://img.shields.io/badge/AppVersion-v4.1.2-informational?style=flat-square)

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
| operator.clusterDomain | string | `""` |  |
| operator.nsToWatch | string | `""` |  |
| operator.image.repository | string | `"minio/operator"` |  |
| operator.image.tag | string | `"v4.1.2"` |  |
| operator.image.pullPolicy | string | `"IfNotPresent"` |  |
| operator.imagePullSecrets | list | `[]` |  |
| operator.replicaCount | int | `1` |  |
| operator.securityContext.runAsUser | int | `1000` |  |
| operator.securityContext.runAsGroup | int | `1000` |  |
| operator.securityContext.runAsNonRoot | bool | `true` |  |
| operator.securityContext.fsGroup | int | `1000` |  |
| operator.resources.requests.cpu | string | `"200m"` |  |
| operator.resources.requests.memory | string | `"256Mi"` |  |
| operator.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| console.image.repository | string | `"minio/console"` |  |
| console.image.tag | string | `"v0.7.4"` |  |
| console.image.pullPolicy | string | `"IfNotPresent"` |  |
| console.imagePullSecrets | list | `[]` |  |
| console.replicaCount | int | `1` |  |
| console.resources | object | `{}` |  |
| tenants[0].name | string | `"minio1"` |  |
| tenants[0].image.repository | string | `"minio/minio"` |  |
| tenants[0].image.tag | string | `"RELEASE.2021-06-17T00-10-46Z"` |  |
| tenants[0].image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants[0].namespace | string | `"default"` |  |
| tenants[0].imagePullSecret | object | `{}` |  |
| tenants[0].scheduler | object | `{}` |  |
| tenants[0].pools[0].servers | int | `4` |  |
| tenants[0].pools[0].volumesPerServer | int | `4` |  |
| tenants[0].pools[0].size | string | `"10Gi"` |  |
| tenants[0].pools[0].storageClassName | string | `"standard"` |  |
| tenants[0].pools[0].tolerations | object | `{}` |  |
| tenants[0].pools[0].nodeSelector | object | `{}` |  |
| tenants[0].pools[0].affinity | object | `{}` |  |
| tenants[0].pools[0].resources | object | `{}` |  |
| tenants[0].pools[0].securityContext | object | `{}` |  |
| tenants[0].mountPath | string | `"/export"` |  |
| tenants[0].subPath | string | `"/data"` |  |
| tenants[0].secrets.enabled | bool | `true` |  |
| tenants[0].secrets.name | string | `"minio1-secret"` |  |
| tenants[0].secrets.accessKey | string | `"minio"` |  |
| tenants[0].secrets.secretKey | string | `"minio123"` |  |
| tenants[0].metrics.enabled | bool | `false` |  |
| tenants[0].metrics.port | int | `9000` |  |
| tenants[0].certificate.externalCertSecret | object | `{}` |  |
| tenants[0].certificate.requestAutoCert | bool | `true` |  |
| tenants[0].certificate.certConfig | object | `{}` |  |
| tenants[0].s3.bucketDNS | bool | `false` |  |
| tenants[0].podManagementPolicy | string | `"Parallel"` |  |
| tenants[0].serviceMetadata | object | `{}` |  |
| tenants[0].env | object | `{}` |  |
| tenants[0].priorityClassName | string | `""` |  |
| tenants[0].console.image.repository | string | `"minio/console"` |  |
| tenants[0].console.image.tag | string | `"v0.7.4"` |  |
| tenants[0].console.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants[0].console.replicaCount | int | `1` |  |
| tenants[0].console.secrets.enabled | bool | `true` |  |
| tenants[0].console.secrets.name | string | `"console-secret"` |  |
| tenants[0].console.secrets.passphrase | string | `"SECRET"` |  |
| tenants[0].console.secrets.salt | string | `"SECRET"` |  |
| tenants[0].console.secrets.accessKey | string | `"YOURCONSOLEACCESS"` |  |
| tenants[0].console.secrets.secretKey | string | `"YOURCONSOLESECRET"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
