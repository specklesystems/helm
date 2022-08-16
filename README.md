# Speckle Server Helm Charts

This Helm chart bundles all Speckle developed components of the Speckle server deployment.
Please note that data storage and persistence requirements of the app are not installed by the chart in its current form.

The required dependencies are listed in our deployment [dependencies](https://speckle.guide/dev/server-manualsetup.html#dependencies) page.

## Pre-requisite

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

## Usage

Once Helm has been set up correctly, add the repo as follows:

`$ helm repo add speckle https://specklesystems.github.io/helm`

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
speckle` to see the charts.

To install the speckle-server chart:

`$ helm install my-speckle-server speckle/speckle-server`

where `my-speckle-server` is going to be the name of the deployment.
By default the chart will install in the `speckle-test` namespace, that name can be set in the chart values. 

To uninstall the chart:

`$ helm delete my-speckle-server`

## Parameters
