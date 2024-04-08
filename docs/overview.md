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

When Istio hardening is enabled through the settings `istio.enabled` and `istio.enabled.hardened`, a sidecar is injected into the `minio-operator` namespace. This sidecar limits network traffic to 'REGISTRY_ONLY', effectively blocking access to external services.

> **Note:** Access to external services will be blocked.

This restriction commonly affects cloud provider object stores configured in the Minio UI. To resolve this, you'll need to identify the hosts blocked by Istio and add a `customServiceEntry` for each one to your Big Bang `values.yaml` file.

### Discovering Blocked Hosts

To find out which hosts are being blocked, inspect the `istio-proxy` logs from the `minio-operator` Twistlock pod using the following commands:

```bash
export SOURCE_POD=$(kubectl -n minio-operator get pod -l name=minio-operator -o jsonpath={.items..metadata.name})
kubectl -n minio-operator logs "$SOURCE_POD" -c istio-proxy | grep -i "BlackHoleCluster"
```

Here is an example of a `customServiceEntry` that can be added to your Big Bang `values.yaml`
```yaml
istio:
  enabled: true
  hardened:
    enabled: true
    customServiceEntries:
     - name: "allow-amazonaws"
       enabled: true
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
