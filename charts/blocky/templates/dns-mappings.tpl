{{- define "helm-charts.blocky.dns-mappings" -}}
apiVersion: blocky.io/v1
kind: DnsMapping
metadata:
  name: blocky-portal
  namespace: {{ .Release.Namespace }}
spec:
  domain: {{ .Value.dnsMappings.portal.domain }}
  ip: {{ .Value.service.loadBalancerIP }}
---
  {{- range $mapping := $.Values.dnsMappings.custom }}
apiVersion: blocky.io/v1
kind: DnsMapping
metadata:
  name: {{ $mapping.name }}
  namespace: {{ .Release.Namespace }}
spec:
  domain: {{ $mapping.domain }}
  ip: {{ $mapping.ip }}
---
  {{- end }}
{{- end -}}