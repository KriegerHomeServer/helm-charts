{{- define "helm-charts.blocky.traefik" -}}
  {{- if .Values.traefik.enabled }}
apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: blocky-ingress
  namespace: {{ .Release.Namespace }}
  annotations:
    "helm.sh/hook": post-install,post-upgrade
spec:
  entryPoints:
    - web
  routes:
    - kind: Rule
      match: Host(`{{ .Values.dnsMappings.portal.domain }}`)
      services:
        - kind: Service
          name: blocky-service-cip
          port: 80
  {{- end }}
{{- end -}}