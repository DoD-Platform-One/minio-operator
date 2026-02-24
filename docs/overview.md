# MinIO Operator

## Overview

MinIO is an object storage application that is fully compatible with the S3 API. Deploying MinIO enables portability for apps that need S3 as a backend so they can run outside of an AWS environment.

The MinIO operator is a [Kubernetes Operator](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/) used to manage the deployment of MinIO tenants into the cluster.

## Dependencies

This chart does not technically depend on anything, however if you want to actually deploy an instance of MinIO into the cluster you will need to also use the [minio](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio) Big Bang package. Put another way, the MinIO package depends on this one to deploy an instance of MinIO in Kubernetes.

## How it works

This chart deploys an instance of the MinIO operator in the `minio-operator` namespace. To deploy MinIO, `minioOperator` and `minio` must both be enabled through the addons functionality in the Big Bang [values.yaml](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/blob/master/chart/values.yaml). This will create an instance of MinIO in the `minio` namespace.

## External Resources

- Source code & docs ([GitHub](https://github.com/minio/operator))
- [OperatorHub](https://operatorhub.io/operator/minio-operator)


## Granting Egress to Blocked Services

When Istio is enabled with a restrictive outbound traffic policy, a sidecar is injected into the `minio-operator` namespace. This sidecar can limit network traffic to `REGISTRY_ONLY`, effectively blocking access to external services.

> **Note:** Access to external services will be blocked when using `REGISTRY_ONLY` mode.

This restriction commonly affects cloud provider object stores configured in the MinIO UI. To resolve this, you'll need to identify the hosts blocked by Istio and add a ServiceEntry for each one to your values.

### Discovering Blocked Hosts

To find out which hosts are being blocked, inspect the `istio-proxy` logs from the `minio-operator` pod using the following commands:

```bash
export SOURCE_POD=$(kubectl -n minio-operator get pod -l app.kubernetes.io/name=minio-operator -o jsonpath={.items..metadata.name})
kubectl -n minio-operator logs "$SOURCE_POD" -c istio-proxy | grep -i "BlackHoleCluster"
```

### Configuring Istio with bb-common

This chart uses `bb-common` for Istio resource rendering. Here is an example configuration to enable Istio with a custom ServiceEntry:

```yaml
istio:
  enabled: true
  sidecar:
    enabled: true
    outboundTrafficPolicyMode: REGISTRY_ONLY
  serviceEntries:
    custom:
      - name: "allow-amazonaws"
        spec:
          hosts:
            - "<bucket-name>.s3.us-gov-west-1.amazonaws.com"
          location: MESH_EXTERNAL
          exportTo:
            - "."
          ports:
            - name: https
              number: 443
              protocol: TLS
          resolution: DNS
```

See the [bb-common Istio documentation](https://repo1.dso.mil/big-bang/product/packages/bb-common/-/tree/main/docs/istio) for full configuration options.
