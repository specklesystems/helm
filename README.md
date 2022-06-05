<h1 align="center">
  <img src="https://user-images.githubusercontent.com/2679513/131189167-18ea5fe1-c578-47f6-9785-3748178e4312.png" width="150px"/><br/>
  Speckle | Helm
</h1>
<h3 align="center">
    Helm chart
</h3>
<p align="center"><b>Speckle</b> is data infrastructure for the AEC industry.</p><br/>

<p align="center"><a href="https://twitter.com/SpeckleSystems"><img src="https://img.shields.io/twitter/follow/SpeckleSystems?style=social" alt="Twitter Follow"></a> <a href="https://speckle.community"><img src="https://img.shields.io/discourse/users?server=https%3A%2F%2Fspeckle.community&amp;style=flat-square&amp;logo=discourse&amp;logoColor=white" alt="Community forum users"></a> <a href="https://speckle.systems"><img src="https://img.shields.io/badge/https://-speckle.systems-royalblue?style=flat-square" alt="website"></a> <a href="https://speckle.guide/dev/"><img src="https://img.shields.io/badge/docs-speckle.guide-orange?style=flat-square&amp;logo=read-the-docs&amp;logoColor=white" alt="docs"></a></p>

# About Speckle

What is Speckle? Check our [![YouTube Video Views](https://img.shields.io/youtube/views/B9humiSpHzM?label=Speckle%20in%201%20minute%20video&style=social)](https://www.youtube.com/watch?v=B9humiSpHzM)

## Helm

This is the [helm](https://helm.sh/) chart for [Speckle server](https://github.com/specklesystems/speckle-server).  This helm chart provides a convenient method of deploying Speckle server on a [Kubernetes](https://kubernetes.io/) cluster.

This chart has been tested to work with [NGINX Ingress](https://kubernetes.github.io/ingress-nginx/), [cert-manager](https://cert-manager.io/), [Bitnami sealed-secrets](https://github.com/bitnami-labs/sealed-secrets), [Prometheus](https://prometheus.io/), and [Grafana](https://grafana.com/) on both a [kind](https://kind.sigs.k8s.io/) and [Digital Ocean](https://www.digitalocean.com/products/kubernetes) kubernetes cluster.

### Usage
Please refer to the official [speckle helm release](https://specklesystems.github.io/helm/) documentation.

## Developing and Debugging

### Contributing

Please make sure you read the [contribution guidelines](https://github.com/specklesystems/speckle-server/blob/main/CONTRIBUTING.md) for an overview of the best practices we try to follow.

### Security

For any security vulnerabilities or concerns, please contact us directly at security[at]speckle.systems.

### License

Unless otherwise described, the code in this repository is licensed under the Apache-2.0 License. Please note that some modules, extensions or code herein might be otherwise licensed. This is indicated either in the root of the containing folder under a different license file, or in the respective file's header. If you have any questions, don't hesitate to get in touch with us via [email](mailto:hello@speckle.systems).
