{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minio-operator.fullname" -}}
  {{- $name := default .Chart.Name -}}
  {{- if contains $name .Release.Name -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}

{{/*
Override the upstream chart's definition to allow nameOverride
*/}}
{{- define "minio-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Override the upstream chart's definition to allow nameOverride
*/}}
{{- define "minio-operator.chart" -}}
  {{- printf "%s-%s" (include "minio-operator.name" .) .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified console name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minio-operator.console-fullname" -}}
  {{- printf "%s-%s" .Release.Name "console" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "minio.labels" -}}
app: minio
{{- end }}
