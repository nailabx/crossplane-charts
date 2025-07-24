{{- define "application.releaseName" -}}
{{- /*
  Generates a Helm release name.
  Context: (dict "name" .name "Values" .Values)
  Example: <appname>-<global-project-hash>
*/ -}}
{{- $appName := .name -}}
{{- $globalProject := .Values.global.project | default "default" -}}
{{- $globalNamespace := .Values.global.namespace | default "default" -}}
{{- $configString := printf "%s-%s" $globalProject $globalNamespace -}}
{{- $configHash := $configString | sha256sum | trunc 8 -}}
{{- printf "%s-%s" $appName $configHash -}}
{{- end -}}