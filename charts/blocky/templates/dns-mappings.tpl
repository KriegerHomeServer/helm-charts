{{- define "helm-charts.blocky.dns-mappings" -}}
apiVersion: blocky.io/v1
kind: DnsMapping
metadata:
  name: blocky-portal
  namespace: {{ .Release.Namespace }}
  annotations:
    "helm.sh/hook": post-install,post-upgrade
spec:
  domain: {{ .Values.dnsMappings.portal.domain }}
  ip: {{ .Values.service.loadBalancerIP }}
---
  {{- range $mapping := $.Values.dnsMappings.custom }}
apiVersion: blocky.io/v1
kind: DnsMapping
metadata:
  name: {{ $mapping.name }}
  namespace: {{ $.Release.Namespace }}
  annotations:
    "helm.sh/hook": post-install,post-upgrade
spec:
  domain: {{ $mapping.domain }}
  ip: {{ $mapping.ip }}
---
  {{- end }}
{{- end -}}