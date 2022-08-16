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
