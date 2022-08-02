# Speckle Server Helm Charts

This Helm chart bundles all Speckle developed components of the Speckle server deployment.
Please note that data storage and persistence requirements of the app are not installed by the chart, as these are external dependencies. The required dependencies are listed in our deployment [dependencies](https://speckle.guide/dev/server-manualsetup.html#dependencies) page.

## Usage

A full guide to deploying on Kubernetes can be found in [Speckle's Documentation](http://speckle.guide/dev/server-setup-k8s.html), we recommend that you follow this guide if you are new to Kubernetes or Helm.

### Pre-requisite

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

### Instructions

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

To uninstall the chart:

```shell
$ helm uninstall my-speckle-server --namespace speckle-test
```
