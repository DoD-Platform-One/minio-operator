# MinIO Operator

[![MinIO](https://raw.githubusercontent.com/minio/minio/master/.github/logo.svg?sanitize=true)](https://min.io)

MinIO is a Kubernetes-native high performance object store with an S3-compatible API. The
MinIO Kubernetes Operator supports deploying MinIO Tenants onto private and public
cloud infrastructures ("Hybrid" Cloud).

More detailed and specific information on Minio and the Minio Operator can be found in the "upstream" folder of this
repository or at https://github.com/minio/operator .

The Platform One Deployment of Minio Operator and Minio Instances is based on deployments using Helm Charts.   The
Kubectl command line extension is not used.

## Table of Contents

* [Architecture](#architecture)
* [Create a MinIO Tenant](#create-a-minio-tenant)
* [Kubernetes Cluster Configuration](#kubernetes-cluster-configuration)
  * [Default Storage Class](#default-storage-class)
  * [Local Persistent Volumes](#local-persistent-volumes)
  * [MinIO Tenant Namespace](#minio-tenant-namespace)

# Architecture

Each MinIO Tenant represents an independent MinIO Object Store within
the Kubernetes cluster. The following diagram describes the architecture of a
MinIO Tenant deployed into Kubernetes:

![Tenant Architecture](upstream/operator/docs/images/architecture.png)

## Prerequisites

- Starting with Operator v4.0.0, MinIO requires Kubernetes version 1.19.0 or later. Previous versions of the Operator supported Kubernetes 1.17.0 or later. You must upgrade your Kubernetes cluster to 1.19.0 or later to use Operator v4.0.0+.

- This procedure assumes the cluster contains a
  [namespace](https://github.com/minio/operator/blob/master/README.md#minio-tenant-namespace) for
  the MinIO Tenant.

- This procedure assumes the cluster contains a
  [`StorageClass`](https://github.com/minio/operator/blob/master/README.md#default-storage-class)
  for the MinIO Tenant Persistent Volumes  (`PV`). The `StorageClass`
  *must* have `volumeBindingMode: WaitForFirstConsumer`

## Creating a Tenant

A tenant can be created by copying the Minio repository (https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio)
and deploying it in to a namespace created for your tenant.

## Connecting to the Tenant

MinIO outputs credentials for connecting to the MinIO Tenant as part of the creation
process:

```sh

Tenant 'minio-tenant-1' created in 'minio-tenant-1' Namespace
  Username: admin
  Password: dbc978c2-bfbe-41bf-9dc6-699c76bafcd0
+-------------+------------------------+------------------+--------------+-----------------+
| APPLICATION |      SERVICE NAME      |     NAMESPACE    | SERVICE TYPE | SERVICE PORT(S) |
+-------------+------------------------+------------------+--------------+-----------------+
| MinIO       | minio                  | minio-tenant-1   | ClusterIP    | 443             |
| Console     | minio-tenant-1-console | minio-tenant-1   | ClusterIP    | 9090,9443       |
+-------------+------------------------+------------------+--------------+-----------------+

```

# Kubernetes Cluster Configuration

## Default Storage Class

The MinIO Kubernetes Plugin (`kubectl minio`) automatically generates
Persistent Volume Claims (`PVC`) as part of deploying a MinIO Tenant.
The plugin defaults to creating each `PVC` with the `default`
Kubernetes [`Storage Class`](https://kubernetes.io/docs/concepts/storage/storage-classes/).

MinIO Tenants *require* that the `StorageClass` set
`volumeBindingMode` to `WaitForFirstConsumer`. The default `StorageClass` may use the
`Immediate` setting, which can cause complications during `PVC` binding. MinIO
strongly recommends creating a custom `StorageClass` for use by
`PV` supporting a MinIO Tenant:

The following `StorageClass` object contains the appropriate fields for use with the MinIO Plugin:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
    name: local-storage
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
```

To specify the storage class, include the `--storage-class` option to
`kubectl minio tenant create`.


## Local Persistent Volumes

MinIO automatically creates Persistent Volume Claims (PVC) as part of Tenant creation.
Ensure the cluster has at least one
[Persistent Volume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
for each PVC MinIO requests.

You can estimate the number of PVC by multiplying the number of `minio` server pods in the
Tenant by the number of drives per node. For example, a 4-node Tenant with
4 drives per node requires 16 PVC and therefore 16 PV.

MinIO *strongly recommends* using the following CSI drivers for
creating local PV to ensure best object storage performance:

- [Local Persistent Volume](https://kubernetes.io/docs/concepts/storage/volumes/#local)
- [OpenEBS Local PV](https://docs.openebs.io/docs/next/localpv.html)

## MinIO Tenant Namespace

MinIO supports no more than *one* MinIO Tenant per Namespace. The following
`kubectl` command creates a new namespace for the MinIO Tenant.

```sh
kubectl create namespace minio-tenant-1
```
# License

Use of MinIO Operator is governed by the GNU AGPLv3 or later, found in the [LICENSE](./LICENSE) file.

# Explore Further

- [Create a MinIO Tenant](https://github.com/minio/operator#create-a-minio-tenant).
- [TLS for MinIO Tenant](https://github.com/minio/operator/blob/master/docs/tls.md).
- [Examples for MinIO Tenant Settings](https://github.com/minio/operator/blob/master/docs/examples.md)
- [Custom Hostname Discovery](https://github.com/minio/operator/blob/master/docs/custom-name-templates.md).
- [Apply PodSecurityPolicy](https://github.com/minio/operator/blob/master/docs/pod-security-policy.md).
- [Deploy MinIO Tenant with Console](https://github.com/minio/operator/blob/master/docs/console.md).
- [Deploy MinIO Tenant with KES](https://github.com/minio/operator/blob/master/docs/kes.md).
- [Tenant API Documentation](docs/crd.adoc)
