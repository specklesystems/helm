<h1 align="center">
  <img src="https://user-images.githubusercontent.com/2679513/131189167-18ea5fe1-c578-47f6-9785-3748178e4312.png" width="150px"/><br/>
  Speckle | Helm Chart
</h1>
<h3 align="center">
    <a href="https://helm.sh/">Helm</a> chart for deploying <a href="https://github.com/specklesystems/speckle-server">Speckle server</a> to <a href="https://kubernetes.io/">Kubernetes</a>
</h3>
<p align="center"><b>Speckle</b> is data infrastructure for the AEC industry.</p><br/>

<p align="center"><a href="https://twitter.com/SpeckleSystems"><img src="https://img.shields.io/twitter/follow/SpeckleSystems?style=social" alt="Twitter Follow"></a> <a href="https://speckle.community"><img src="https://img.shields.io/discourse/users?server=https%3A%2F%2Fspeckle.community&amp;style=flat-square&amp;logo=discourse&amp;logoColor=white" alt="Community forum users"></a> <a href="https://speckle.systems"><img src="https://img.shields.io/badge/https://-speckle.systems-royalblue?style=flat-square" alt="website"></a> <a href="https://speckle.guide/dev/"><img src="https://img.shields.io/badge/docs-speckle.guide-orange?style=flat-square&amp;logo=read-the-docs&amp;logoColor=white" alt="docs"></a></p>

# About Speckle

What is Speckle? Check our [![YouTube Video Views](https://img.shields.io/youtube/views/B9humiSpHzM?label=Speckle%20in%201%20minute%20video&style=social)](https://www.youtube.com/watch?v=B9humiSpHzM)

## Features

- **Object-based:** say goodbye to files! Speckle is the first object based platform for the AEC industry
- **Version control:** Speckle is the Git & Hub for geometry and BIM data
- **Collaboration:** share your designs collaborate with others
- **3D Viewer:** see your CAD and BIM models online, share and embed them anywhere
- **Interoperability:** get your CAD and BIM models into other software without exporting or importing
- **Real time:** get real time updates and notifications and changes
- **GraphQL API:** get what you need anywhere you want it
- **Webhooks:** the base for a automation and next-gen pipelines
- **Built for developers:** we are building Speckle with developers in mind and got tools for every stack
- **Built for the AEC industry:** Speckle connectors are plugins for the most common software used in the industry such as Revit, Rhino, Grasshopper, AutoCAD, Civil 3D, Excel, Unreal Engine, Unity, QGIS, Blender, ArchiCAD and more!

## Try Speckle now!

Give Speckle a try in no time by:

- [![speckle XYZ](https://img.shields.io/badge/https://-speckle.xyz-0069ff?style=flat-square&logo=hackthebox&logoColor=white)](https://speckle.xyz) ⇒ creating an account at
- [![deploy to kubernetes](https://img.shields.io/badge/Deploy%20to%20Kubernetes-0069ff?style=flat-square&logo=Kubernetes&logoColor=white)](https://speckle.guide/dev/server-setup-k8s.html) ⇒ Guide to deploying this Helm chart to Kubernetes

## Speckle Server Helm Charts

This Helm chart bundles all Speckle developed components of the Speckle server deployment.
Please note that data storage and persistence requirements of the app are not installed by the chart, as these are external dependencies. The required dependencies are listed in our deployment [dependencies](https://speckle.guide/dev/server-manualsetup.html#dependencies) page.

### Usage

A full guide to deploying on Kubernetes can be found in [Speckle's Documentation](http://speckle.guide/dev/server-setup-k8s.html), we recommend that you follow this guide if you are new to Kubernetes or Helm.

The below are brief notes which will require [additional dependencies](http://speckle.guide/dev/server-setup-k8s.html#step-2-optional-deploy-dependent-external-services) and configuration.

#### Pre-requisite

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

#### Instructions

Once Helm has been set up correctly, add the repo as follows:

```shell
$ helm repo add speckle https://specklesystems.github.io/helm
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.
You can then run `helm search repo speckle` to see the charts.

To install the speckle-server chart:

```shell
$ helm upgrade --install --create-namespace --namespace speckle-test my-speckle-server speckle/speckle-server
```

where `my-speckle-server` will be the name of the Helm release.

More details about the values to configure for your release can be found in [Speckle's Documentation](http://speckle.guide/dev/server-setup-k8s.html#step-4-configure-your-deployment)

By default the chart will install in the `speckle-test` namespace, that name can be set in the chart values.

#### Uninstalling

To uninstall the chart:

```shell
$ helm uninstall my-speckle-server --namespace speckle-test
```

Depending on the Infrastructure on which Speckle was released, a load balancer may have been created.  This may have to be manually deleted.

## Parameters

### Namespace

| Name               | Description                                                                   | Value          |
| ------------------ | ----------------------------------------------------------------------------- | -------------- |
| `namespace`        | The name of the namespace in which Speckle will be deployed.                  | `speckle-test` |
| `create_namespace` | Enabling this will create a new namespace into which Speckle will be deployed | `false`        |


### SSL

| Name                  | Description                                                                         | Value                 |
| --------------------- | ----------------------------------------------------------------------------------- | --------------------- |
| `domain`              | The DNS host name at which this Speckle deployment will be reachable                | `localhost`           |
| `ssl_canonical_url`   | HTTPS protocol will be the preferred protocol for serving this Speckle deployment   | `true`                |
| `cert_manager_issuer` | The name of the ClusterIssuer kubernetes resource that provides the SSL Certificate | `letsencrypt-staging` |


### Network Plugin configuration

This is used to define the type of network policy that is deployed.
Different Kubernetes Network Plugins or Container Network Interfaces (CNIs) can make use of different types of
Network Policy.  Some of these provide more features than the standard Kubernetes Network Policy.

| Name                 | Description                                                                                                 | Value        |
| -------------------- | ----------------------------------------------------------------------------------------------------------- | ------------ |
| `networkPlugin.type` | (Optional) Used to configure which type of NetworkPolicy is deployed. Options are 'kubernetes' or 'cilium'. | `kubernetes` |


### Ingress metadata for NetworkPolicy

This section is ignored unless networkPolicy is enabled for frontend or server.
The NetworkPolicy uses this value to enable connections from the ingress controller pod in this namespace to reach Speckle.
ref: https://kubernetes.io/docs/concepts/services-networking/network-policies/

| Name                     | Description                                                                 | Value           |
| ------------------------ | --------------------------------------------------------------------------- | --------------- |
| `ingress.namespace`      | The namespace in which the ingress controller is deployed.                  | `ingress-nginx` |
| `ingress.controllerName` | The name of the Kubernetes pod in which the ingress controller is deployed. | `ingress-nginx` |


### Common parameters

| Name                 | Description                                                                                                        | Value          |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ | -------------- |
| `docker_image_tag`   | Speckle is published as a Docker Image.  The version of the image which will be deployed is specified by this tag. | `v2.3.3`       |
| `imagePullPolicy`    | Determines the conditions when the Docker Images for Speckle should be pulled from the Image registry.             | `IfNotPresent` |
| `secretName`         | This is the name of the Kubernetes Secret resource in which secrets for Speckle are stored.                        | `server-vars`  |
| `file_size_limit_mb` | This maximum size of any single file (unit is Megabytes) that can be uploaded to Speckle                           | `100`          |


### Monitoring

This enables metrics generated by Speckle to be ingested by Prometheus: https://prometheus.io/
Enabling this requires Prometheus to have been deployed prior, as this resource expects the Prometheus Customer Resource Definition
for the ServiceMonitor to already be existing within the cluster.
ref: https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/getting-started.md#related-resources

| Name                             | Description                                                                                          | Value   |
| -------------------------------- | ---------------------------------------------------------------------------------------------------- | ------- |
| `enable_prometheus_monitoring`   | If enabled, Speckle deploys a Prometheus ServiceMonitor resource                                     | `false` |
| `prometheusMonitoring.namespace` | If provided, deploys Speckle's Prometheus resources in the given namespace                           | `""`    |
| `prometheusMonitoring.release`   | If provided, adds the value to a `release` label on all the Prometheus resources deployed by Speckle | `""`    |


### Postgres Database

Defines parameters related to connections to the Postgres database.
A secret containing the connection string to the Postgres database must stored within the Kubernetes cluster as an opaque Kubernetes Secret.
The name of the secret must match the `secretName` parameter, and the key within this secret must be `postgres_url`.
ref: https://kubernetes.io/docs/concepts/configuration/secret/#opaque-secrets

| Name                                                      | Description                                                                                                                                                                | Value     |
| --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `db.useCertificate`                                       | If enabled, the certificate defined in db.certificate is used to verify TLS connections to the Postgres database                                                           | `false`   |
| `db.maxConnectionsServer`                                 | The number of connections to the Postgres database to provide in the connection pool                                                                                       | `4`       |
| `db.certificate`                                          | The x509 public certificate for SSL connections to the Postgres database                                                                                                   | `""`      |
| `db.PGSSLMODE`                                            | This defines the level of security used when connecting to the Postgres database                                                                                           | `require` |
| `db.networkPolicy`                                        | If networkPolicy is enabled for any service, this provides the NetworkPolicy with the necessary details to allow egress connections to the Postgres database               |           |
| `db.networkPolicy.port`                                   | the port on the server providing the Postgres database (default: "5432")                                                                                                   | `""`      |
| `db.networkPolicy.externalToCluster`                      | Only required if the Postgres database is not hosted within the Kubernetes cluster in which Speckle will be deployed.                                                      |           |
| `db.networkPolicy.externalToCluster.enabled`              | If enabled, indicates that the Postgres database is hosted externally to the Kubernetes cluster                                                                            | `true`    |
| `db.networkPolicy.inCluster`                              | Only required if the Postgres database is hosted within the Kubernetes cluster in which Speckle will be deployed.                                                          |           |
| `db.networkPolicy.inCluster.enabled`                      | If enabled, indicates that the Postgres database is hosted withing the same Kubernetes cluster in which Speckle will be deployed                                           | `false`   |
| `db.networkPolicy.inCluster.kubernetes.podSelector`       | (Kubernetes Network Policy only) The pod Selector yaml object used to uniquely select the postgres compatible database pods within the cluster and given namespace         | `{}`      |
| `db.networkPolicy.inCluster.kubernetes.namespaceSelector` | (Kubernetes Network Policy only) The namespace selector yaml object used to uniquely select the namespace in which the postgres compatible database pods are deployed      | `{}`      |
| `db.networkPolicy.inCluster.cilium.endpointSelector`      | (Cilium Network Policy only) The endpoint selector yaml object used to uniquely select the in-cluster endpoint in which the postgres compatible database pods are deployed | `{}`      |
| `db.networkPolicy.inCluster.cilium.serviceSelector`       | (Cilium Network Policy only) The service selector yaml object used to uniquely select the in-cluster service providing the postgres compatible database service            | `{}`      |


### S3 Compatible Storage

Defines parameters related to connecting to the S3 compatible storage.
A secret containing the secret key must stored within the Kubernetes cluster as an opaque Kubernetes Secret.
The name of the Kubernetes Secret resource must match the `secretName` parameter, and the key within this Kubernetes Secret must be `s3_secret_key`.
ref: https://kubernetes.io/docs/concepts/configuration/secret/#opaque-secrets

| Name                                                      | Description                                                                                                                                                         | Value   |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `s3.endpoint`                                             | The URL at which the s3 compatible storage is hosted                                                                                                                | `""`    |
| `s3.bucket`                                               | The s3 compatible bucket in which Speckle data will be stored                                                                                                       | `""`    |
| `s3.access_key`                                           | The key of the access key used to authenticate with the s3 compatible storage                                                                                       | `""`    |
| `s3.create_bucket`                                        | If enabled, will create a bucket with the given bucket name at this endpoint                                                                                        | `false` |
| `s3.region`                                               | The region in which the bucket resides (or will be created in).                                                                                                     | `""`    |
| `s3.networkPolicy`                                        | If networkPolicy is enabled for any service, this provides the NetworkPolicy with the necessary details to allow egress connections to the s3 compatible storage    |         |
| `s3.networkPolicy.port`                                   | the port on the server providing the s3 compatible storage (default: "443")                                                                                         | `""`    |
| `s3.networkPolicy.externalToCluster`                      | Only required if the s3 compatible storage is not hosted within the Kubernetes cluster in which Speckle will be deployed.                                           |         |
| `s3.networkPolicy.externalToCluster.enabled`              | If enabled, indicates that the s3 compatible storage is hosted externally to the Kubernetes cluster                                                                 | `true`  |
| `s3.networkPolicy.inCluster`                              | Only required if the s3 compatible storage is hosted within the Kubernetes cluster in which Speckle will be deployed.                                               |         |
| `s3.networkPolicy.inCluster.enabled`                      | If enabled, indicates that the s3 compatible storage is hosted withing the same Kubernetes cluster in which Speckle will be deployed                                | `false` |
| `s3.networkPolicy.inCluster.kubernetes.podSelector`       | (Kubernetes Network Policy only) The pod Selector yaml object used to uniquely select the s3 compatible storage pods within the cluster and given namespace         | `{}`    |
| `s3.networkPolicy.inCluster.kubernetes.namespaceSelector` | (Kubernetes Network Policy only) The namespace selector yaml object used to uniquely select the namespace in which the s3 compatible storage pods are deployed      | `{}`    |
| `s3.networkPolicy.inCluster.cilium.endpointSelector`      | (Cilium Network Policy only) The endpoint selector yaml object used to uniquely select the in-cluster endpoint in which the s3 compatible storage pods are deployed | `{}`    |
| `s3.networkPolicy.inCluster.cilium.serviceSelector`       | (Cilium Network Policy only) The service selector yaml object used to uniquely select the in-cluster service providing the s3 compatible storage service            | `{}`    |


### Redis Store

Defines parameters related to connecting to the Redis Store.
A secret containing the redis url (containing domain, username, and password) must stored within the Kubernetes cluster as an opaque Kubernetes Secret.
The name of the Kubernetes Secret resource must match the `secretName` parameter, and the key within this Kubernetes Secret resource must be `redis_url`.
ref: https://kubernetes.io/docs/concepts/configuration/secret/#opaque-secrets

| Name                                                         | Description                                                                                                                                               | Value   |
| ------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `redis.networkPolicy`                                        | If networkPolicy is enabled for Speckle server, this provides the NetworkPolicy with the necessary details to allow egress connections to the Redis store |         |
| `redis.networkPolicy.port`                                   | the port on the server providing the Redis store (default: "6379")                                                                                        | `""`    |
| `redis.networkPolicy.externalToCluster`                      | Only required if the Redis store is not hosted within the Kubernetes cluster in which Speckle will be deployed.                                           |         |
| `redis.networkPolicy.externalToCluster.enabled`              | If enabled, indicates that the Redis store is hosted externally to the Kubernetes cluster                                                                 | `true`  |
| `redis.networkPolicy.inCluster`                              | is only required if the Redis store is hosted within the Kubernetes cluster in which Speckle will be deployed.                                            |         |
| `redis.networkPolicy.inCluster.enabled`                      | If enabled, indicates that the Redis store is hosted withing the same Kubernetes cluster in which Speckle will be deployed                                | `false` |
| `redis.networkPolicy.inCluster.kubernetes.podSelector`       | (Kubernetes Network Policy only) The pod Selector yaml object used to uniquely select the redis store pods within the cluster and given namespace         | `{}`    |
| `redis.networkPolicy.inCluster.kubernetes.namespaceSelector` | (Kubernetes Network Policy only) The namespace selector yaml object used to uniquely select the namespace in which the redis store pods are deployed      | `{}`    |
| `redis.networkPolicy.inCluster.cilium.endpointSelector`      | (Cilium Network Policy only) The endpoint selector yaml object used to uniquely select the in-cluster endpoint in which the redis pods are deployed       | `{}`    |
| `redis.networkPolicy.inCluster.cilium.serviceSelector`       | (Cilium Network Policy only) The service selector yaml object used to uniquely select the in-cluster service providing the redis store service            | `{}`    |


### Server

Defines parameters related to the backend server component of Speckle.
A secret containing the an unique value (this can be generated randomly) must stored within the Kubernetes cluster as an opaque Kubernetes Secret.
The name of the Kubernetes Secret resource must match the `secretName` parameter, and the key within this Secret resource must be `session_secret`.
ref: https://kubernetes.io/docs/concepts/configuration/secret/#opaque-secrets

| Name                                     | Description                                                                                                                                | Value   |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `server.replicas`                        | The number of instances of the Server pod to be deployed within the cluster.                                                               | `1`     |
| `server.auth`                            | Speckle provides a number of different mechanisms for authenticating users.  Each available option must be configured here.                |         |
| `server.auth.local.enabled`              | If enabled, users can register and authenticate with an email address and password.                                                        | `true`  |
| `server.auth.google.enabled`             | If enabled, users can authenticate via Google with their Google account credentials.                                                       | `false` |
| `server.auth.google.client_id`           | This is the ID for Speckle that you have registered with Google.                                                                           | `""`    |
| `server.auth.github.enabled`             | If enabled, users can authenticate via Github with their Github account credentials.                                                       | `false` |
| `server.auth.github.client_id`           | This is the ID for Speckle that you have registered with Github                                                                            | `""`    |
| `server.auth.azure_ad.enabled`           | If enabled, users can authenticate via Azure Active Directory.                                                                             | `false` |
| `server.auth.azure_ad.org_name`          | This is the Organisation Name that you have registered with Azure                                                                          | `""`    |
| `server.auth.azure_ad.identity_metadata` | This is the identity metadata for Speckle that you have registered with Azure                                                              | `""`    |
| `server.auth.azure_ad.issuer`            | This is the issuer name for Speckle that you have registered with Azure                                                                    | `""`    |
| `server.auth.azure_ad.client_id`         | This is the ID for Speckle that you have registered with Azure                                                                             | `""`    |
| `server.email`                           | Speckle can communicate with users via email, providing account verification and notification.                                             |         |
| `server.email.enabled`                   | If enabled, Speckle can send email to users - for example, email verification for account registration.                                    | `false` |
| `server.email.host`                      | The domain name or IP address of the server hosting the email service.                                                                     | `""`    |
| `server.email.port`                      | The port on the server for the email service.                                                                                              | `""`    |
| `server.email.username`                  | The username with which Speckle will authenticate with the email service.                                                                  | `""`    |
| `server.requests.cpu`                    | The CPU that should be available on a node when scheduling this pod.                                                                       | `500m`  |
| `server.requests.memory`                 | The Memory that should be available on a node when scheduling this pod.                                                                    | `1Gi`   |
| `server.limits.cpu`                      | The maximum CPU that will be made available to the server Pod in a given period.                                                           | `1000m` |
| `server.limits.memory`                   | The maximum Memory that will be made available to the server Pod.                                                                          | `3Gi`   |
| `server.serviceAccount.create`           | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |
| `server.monitoring.apollo.enabled`       | (Optional) If enabled, exports metrics from the GraphQL API to Apollo Graphql Studio.                                                      | `false` |
| `server.monitoring.apollo.graph_id`      | The ID for Speckle that you registered in Apollo Graphql Studio.                                                                           | `""`    |
| `server.sentry_dns`                      | (Optional) The Data Source Name that was provided by Sentry.io                                                                             | `""`    |
| `server.disable_tracking`                | If set to true, will prevent tracking metrics from being collected                                                                         | `false` |
| `server.disable_tracing`                 | If set to true, will prevent tracing metrics from being collected                                                                          | `false` |
| `server.networkPolicy.enabled`           | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `server.affinity`                        | Affinity for Speckle server pods scheduling                                                                                                | `{}`    |
| `server.nodeSelector`                    | Node labels for Speckle server pods scheduling                                                                                             | `{}`    |
| `server.tolerations`                     | Tolerations for Speckle server pods scheduling                                                                                             | `[]`    |
| `server.topologySpreadConstraints`       | Spread Constraints for Speckle server pod scheduling                                                                                       | `[]`    |


### Frontend

Defines parameters related to the frontend server component of Speckle.

| Name                                 | Description                                                                                                                                | Value   |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `frontend.replicas`                  | The number of instances of the Frontend pod to be deployed within the cluster.                                                             | `1`     |
| `frontend.requests.cpu`              | The CPU that should be available on a node when scheduling this pod.                                                                       | `250m`  |
| `frontend.requests.memory`           | The Memory that should be available on a node when scheduling this pod.                                                                    | `256Mi` |
| `frontend.limits.cpu`                | The maximum CPU that will be made available to the frontend Pod in a given period.                                                         | `1000m` |
| `frontend.limits.memory`             | The maximum Memory that will be made available to the frontend Pod.                                                                        | `512Mi` |
| `frontend.networkPolicy.enabled`     | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `frontend.affinity`                  | Affinity for Speckle frontend pod scheduling                                                                                               | `{}`    |
| `frontend.nodeSelector`              | Node labels for Speckle frontend pods scheduling                                                                                           | `{}`    |
| `frontend.tolerations`               | Tolerations for Speckle frontend pods scheduling                                                                                           | `[]`    |
| `frontend.topologySpreadConstraints` | Spread Constraints for Speckle frontend pod scheduling                                                                                     | `[]`    |
| `frontend.serviceAccount.create`     | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |


### Preview Service

Defines parameters related to the Preview Service component of Speckle.

| Name                                        | Description                                                                                                                                | Value   |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `preview_service.replicas`                  | The number of instances of the Preview Service pod to be deployed within the cluster.                                                      | `1`     |
| `preview_service.requests.cpu`              | The CPU that should be available on a node when scheduling this pod.                                                                       | `500m`  |
| `preview_service.requests.memory`           | The Memory that should be available on a node when scheduling this pod.                                                                    | `2Gi`   |
| `preview_service.limits.cpu`                | The maximum CPU that will be made available to the Preview Service Pod in a given period.                                                  | `1000m` |
| `preview_service.limits.memory`             | The maximum Memory that will be made available to the Preview Service Pod.                                                                 | `4Gi`   |
| `preview_service.networkPolicy.enabled`     | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `preview_service.affinity`                  | Affinity for Speckle Preview Service pod scheduling                                                                                        | `{}`    |
| `preview_service.nodeSelector`              | Node labels for Speckle Preview Service pods scheduling                                                                                    | `{}`    |
| `preview_service.tolerations`               | Tolerations for Speckle Preview Service pods scheduling                                                                                    | `[]`    |
| `preview_service.topologySpreadConstraints` | Spread Constraints for Speckle Preview Service pod scheduling                                                                              | `[]`    |
| `preview_service.serviceAccount.create`     | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |


### Webhook Service

Defines parameters related to the Webhook Service component of Speckle.

| Name                                        | Description                                                                                                                                | Value   |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `webhook_service.replicas`                  | The number of instances of the Webhook Service pod to be deployed within the cluster.                                                      | `1`     |
| `webhook_service.requests.cpu`              | The CPU that should be available on a node when scheduling this pod.                                                                       | `500m`  |
| `webhook_service.requests.memory`           | The Memory that should be available on a node when scheduling this pod.                                                                    | `2Gi`   |
| `webhook_service.limits.cpu`                | The maximum CPU that will be made available to the Webhook Service Pod in a given period.                                                  | `1000m` |
| `webhook_service.limits.memory`             | The maximum Memory that will be made available to the Webhook Service Pod.                                                                 | `4Gi`   |
| `webhook_service.networkPolicy.enabled`     | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `webhook_service.affinity`                  | Affinity for Speckle Webhook Service pod scheduling                                                                                        | `{}`    |
| `webhook_service.nodeSelector`              | Node labels for Speckle Webhook Service pods scheduling                                                                                    | `{}`    |
| `webhook_service.tolerations`               | Tolerations for Speckle Webhook Service pods scheduling                                                                                    | `[]`    |
| `webhook_service.topologySpreadConstraints` | Spread Constraints for Speckle Webhook Service pod scheduling                                                                              | `[]`    |
| `webhook_service.serviceAccount.create`     | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |


### File Import Service

Defines parameters related to the File Import Service component of Speckle.

| Name                                           | Description                                                                                                                                | Value   |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `fileimport_service.replicas`                  | The number of instances of the FileImport Service pod to be deployed within the cluster.                                                   | `1`     |
| `fileimport_service.requests.cpu`              | The CPU that should be available on a node when scheduling this pod.                                                                       | `100m`  |
| `fileimport_service.requests.memory`           | The Memory that should be available on a node when scheduling this pod.                                                                    | `512Mi` |
| `fileimport_service.limits.cpu`                | The maximum CPU that will be made available to the FileImport Service Pod in a given period.                                               | `1000m` |
| `fileimport_service.limits.memory`             | The maximum Memory that will be made available to the FileImport Service Pod.                                                              | `2Gi`   |
| `fileimport_service.networkPolicy.enabled`     | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `fileimport_service.affinity`                  | Affinity for Speckle FileImport Service pod scheduling                                                                                     | `{}`    |
| `fileimport_service.nodeSelector`              | Node labels for Speckle FileImport Service pods scheduling                                                                                 | `{}`    |
| `fileimport_service.tolerations`               | Tolerations for Speckle FileImport Service pods scheduling                                                                                 | `[]`    |
| `fileimport_service.topologySpreadConstraints` | Spread Constraints for Speckle FileImport Service pod scheduling                                                                           | `[]`    |
| `fileimport_service.serviceAccount.create`     | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |
| `fileimport_service.time_limit_min`            | The maximum time that a file can take to be processed by the FileImport Service.                                                           | `10`    |


### Monitoring

Provides Speckle with metrics related to the Postgres database.

| Name                                   | Description                                                                                                                                | Value   |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `monitoring.replicas`                  | The number of instances of the Monitoring pod to be deployed within the cluster.                                                           | `1`     |
| `monitoring.requests.cpu`              | The CPU that should be available on a node when scheduling this pod.                                                                       | `100m`  |
| `monitoring.requests.memory`           | The Memory that should be available on a node when scheduling this pod.                                                                    | `64Mi`  |
| `monitoring.limits.cpu`                | The maximum CPU that will be made available to the Monitoring Pod in a given period.                                                       | `200m`  |
| `monitoring.limits.memory`             | The maximum Memory that will be made available to the Monitoring Pod.                                                                      | `512Mi` |
| `monitoring.networkPolicy.enabled`     | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `monitoring.affinity`                  | Affinity for Speckle Monitoring pod scheduling                                                                                             | `{}`    |
| `monitoring.nodeSelector`              | Node labels for Speckle Monitoring pods scheduling                                                                                         | `{}`    |
| `monitoring.tolerations`               | Tolerations for Speckle Monitoring pods scheduling                                                                                         | `[]`    |
| `monitoring.topologySpreadConstraints` | Spread Constraints for Speckle Monitoring pod scheduling                                                                                   | `[]`    |
| `monitoring.serviceAccount.create`     | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |


### Testing

Defines parameters related to testing that the deployment of Speckle has been successful.

| Name                         | Description                                                                                                                                | Value   |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `helm_test_enabled`          | If enabled, an additional pod is deployed which verifies some functionality of Speckle to determine if it is deployed correctly            | `true`  |
| `test.requests.cpu`          | The CPU that should be available on a node when scheduling this pod.                                                                       | `100m`  |
| `test.requests.memory`       | The Memory that should be available on a node when scheduling this pod.                                                                    | `64Mi`  |
| `test.limits.cpu`            | The maximum CPU that will be made available to the Test Pod in a given period.                                                             | `200m`  |
| `test.limits.memory`         | The maximum Memory that will be made available to the Test Pod.                                                                            | `512Mi` |
| `test.networkPolicy.enabled` | If enabled, will provide additional security be limiting network traffic into and out of the pod to only the required endpoints and ports. | `false` |
| `test.serviceAccount.create` | If enabled, a Kubernetes Service Account will be created for this pod.                                                                     | `true`  |


## Resources

- [![Community forum users](https://img.shields.io/badge/community-forum-green?style=for-the-badge&logo=discourse&logoColor=white)](https://speckle.community) for help, feature requests or just to hang with other speckle enthusiasts, check out our community forum!
- [![website](https://img.shields.io/badge/tutorials-speckle.systems-royalblue?style=for-the-badge&logo=youtube)](https://speckle.systems) our tutorials portal is full of resources to get you started using Speckle
- [![docs](https://img.shields.io/badge/docs-speckle.guide-orange?style=for-the-badge&logo=read-the-docs&logoColor=white)](https://speckle.guide/dev/) reference on almost any end-user and developer functionality

### Other repos

Make sure to also check and ⭐️ these other Speckle repositories:

- [`speckle-server`](https://github.com/specklesystems/speckle-server): Speckle Server
- [`speckle-sharp`](https://github.com/specklesystems/speckle-sharp): .NET tooling, connectors and interoperability
- [`specklepy`](https://github.com/specklesystems/specklepy): Python SDK 🐍
- [`speckle-excel`](https://github.com/specklesystems/speckle-excel): Excel connector
- [`speckle-unity`](https://github.com/specklesystems/speckle-unity): Unity 3D connector
- [`speckle-blender`](https://github.com/specklesystems/speckle-blender): Blender connector
- [`speckle-unreal`](https://github.com/specklesystems/speckle-unreal): Unreal Engine Connector
- [`speckle-qgis`](https://github.com/specklesystems/speckle-qgis): QGIS connectod
- [`speckle-powerbi`](https://github.com/specklesystems/speckle-powerbi): PowerBi connector
- and more [connectors & tooling](https://github.com/specklesystems/)!

## Developing and Debugging

This repository is a clone of the [Helm chart](https://github.com/specklesystems/speckle-server/tree/main/utils/helm/speckle-server) in the [Speckle Server repository](https://github.com/specklesystems/speckle-server).

**⚠️ Pull requests are not accepted to this repository ⚠️**.
Instead, please contribute to the [Helm chart](https://github.com/specklesystems/speckle-server/tree/main/utils/helm/speckle-server) within the [Speckle Server repository](https://github.com/specklesystems/speckle-server).

### Security

For any security vulnerabilities or concerns, please contact us directly at security[at]speckle.systems.

### License

Unless otherwise described, the code in this repository is licensed under the Apache-2.0 License. Please note that some modules, extensions or code herein might be otherwise licensed. This is indicated either in the root of the containing folder under a different license file, or in the respective file's header. If you have any questions, don't hesitate to get in touch with us via [email](mailto:hello@speckle.systems).
