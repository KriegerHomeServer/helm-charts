{{- define "helm-charts.blocky.service-accounts" -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: cronjob-sa
  namespace: {{ .Release.Namespace }}
{{- end -}}