{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "speckle.chartNameAndVersion" -}}
{{- printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Expand the name of the chart.
*/}}
{{- define "speckle.chartName" -}}
{{- $context := . -}}
{{- default $context.Chart.Name $context.Values.chartNameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
Expects an argument which is a list of the context and the deployment name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "speckle.fullname" -}}
{{- $context := index . 0 -}}
{{- $deploymentName := index . 1 -}}
{{- $deploymentNameSuffixLen := len $deploymentName | add1 -}}
{{- if $context.Values.fullnameOverride -}}
    {{- printf "%s-%s" $context.Values.fullnameOverride $deploymentName | trunc 63 | trimSuffix "-" -}}
{{- else -}}
    {{- $chartName := default $context.Chart.Name $context.Values.chartNameOverride -}}
    {{- if contains $chartName $context.Release.Name -}}
        {{- printf "%s-%s" ($context.Release.Name | trunc (sub 63 $deploymentNameSuffixLen | int) | trimSuffix "-") $deploymentName -}}
    {{- else -}}
        {{- printf "%s-%s" (printf "%s-%s" $context.Release.Name $chartName | trunc (sub 63 $deploymentNameSuffixLen | int) | trimSuffix "-") $deploymentName -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "speckle.labels" -}}
{{- $context := index . 0 -}}
{{- $deploymentName := index . 1 -}}
app: {{ include "speckle.fullname" (list $context $deploymentName) | quote }}
helm.sh/chart: {{ include "speckle.chartName" $context | quote }}
{{ include "speckle.selectorLabels" (list $context $deploymentName) }}
app.kubernetes.io/managed-by: {{ $context.Release.Service | quote }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "speckle.selectorLabels" -}}
{{- $context := index . 0 -}}
{{- $deploymentName := index . 1 -}}
app.kubernetes.io/name: {{ include "speckle.fullname" (list $context $deploymentName) | quote }}
app.kubernetes.io/instance: {{ $context.Release.Name | quote }}
{{ include "speckle.selectorLabels.serviceMonitor" (list $context $deploymentName) }}
{{- end -}}

{{/*
Service monitor selector labels
*/}}
{{- define "speckle.selectorLabels.serviceMonitor" -}}
{{- $context := index . 0 -}}
{{- $deploymentName := index . 1 -}}
project: {{ include "speckle.chartName" $context | quote }}
{{- end -}}

{{/*
=========== backend ===========
*/}}
{{- define "speckle.fullname.backend" -}}
{{- include "speckle.fullname" (list . "speckle-server" ) -}}
{{- end -}}

{{- define "speckle.labels.backend" -}}
{{- include "speckle.labels" (list . "speckle-server") -}}
{{- end -}}

{{- define "speckle.selectorLabels.backend" -}}
{{- include "speckle.selectorLabels" (list . "speckle-server") -}}
{{- end -}}

{{/*
=========== fileimport-service ===========
*/}}
{{- define "speckle.fullname.fileimport-service" -}}
{{- include "speckle.fullname" (list . "fileimport-service" ) -}}
{{- end -}}

{{- define "speckle.labels.fileimport-service" -}}
{{- include "speckle.labels" (list . "fileimport-service") -}}
{{- end -}}

{{- define "speckle.selectorLabels.fileimport-service" -}}
{{- include "speckle.selectorLabels" (list . "fileimport-service") -}}
{{- end -}}

{{/*
=========== frontend ===========
*/}}
{{- define "speckle.fullname.frontend" -}}
{{- include "speckle.fullname" (list . "frontend" ) -}}
{{- end -}}

{{- define "speckle.labels.frontend" -}}
{{- include "speckle.labels" (list . "frontend") -}}
{{- end -}}

{{- define "speckle.selectorLabels.frontend" -}}
{{- include "speckle.selectorLabels" (list . "frontend") -}}
{{- end -}}

{{/*
=========== monitoring ===========
*/}}
{{- define "speckle.fullname.monitoring" -}}
{{- include "speckle.fullname" (list . "monitoring" ) -}}
{{- end -}}

{{- define "speckle.labels.monitoring" -}}
{{- include "speckle.labels" (list . "monitoring") -}}
{{- end -}}

{{- define "speckle.selectorLabels.monitoring" -}}
{{- include "speckle.selectorLabels" (list . "monitoring") -}}
{{- end -}}

{{/*
=========== preview-service ===========
*/}}
{{- define "speckle.fullname.preview-service" -}}
{{- include "speckle.fullname" (list . "preview-service" ) -}}
{{- end -}}

{{- define "speckle.labels.preview-service" -}}
{{- include "speckle.labels" (list . "preview-service") -}}
{{- end -}}

{{- define "speckle.selectorLabels.preview-service" -}}
{{- include "speckle.selectorLabels" (list . "preview-service") -}}
{{- end -}}

{{/*
=========== webhook-service ===========
*/}}
{{- define "speckle.fullname.webhook-service" -}}
{{- include "speckle.fullname" (list . "webhook-service" ) -}}
{{- end -}}

{{- define "speckle.labels.webhook-service" -}}
{{- include "speckle.labels" (list . "webhook-service") -}}
{{- end -}}

{{- define "speckle.selectorLabels.webhook-service" -}}
{{- include "speckle.selectorLabels" (list . "webhook-service") -}}
{{- end -}}

{{/*
=========== test-deployment ===========
*/}}
{{- define "speckle.fullname.test-deployment" -}}
{{- include "speckle.fullname" (list . "test-deployment" ) -}}
{{- end -}}

{{- define "speckle.labels.test-deployment" -}}
{{- include "speckle.labels" (list . "test-deployment") -}}
{{- end -}}
