{{- define "helm-charts.blocky.services" -}}
apiVersion: v1
kind: Service
metadata:
  name: blocky-service
  namespace: {{ .Release.Namespace }}
  labels:
    app: blocky
spec:
  type: {{ .Values.service.type | default "LoadBalancer" }}
  {{- if .Values.service.loadBalancerIP }}
  loadBalancerIP: {{ .Values.service.loadBalancerIP }}
  {{- end }}
  ports:
    - name: dns-tcp
      port: 53
      targetPort: 53
      protocol: TCP
    - name: dns-udp
      port: 53
      targetPort: 53
      protocol: UDP
    {{- if .Values.service.exposeHTTP }}
    - name: http
      port: 80
      targetPort: {{ .Values.deployment.httpPort | default 4000 }}
      protocol: TCP
    {{- end }}
    {{- if .Values.service.exposeHTTPS }}
    - name: https
      port: 443
      targetPort: {{ .Values.deployment.httpPort | default 4000 }}
      protocol: TCP
    {{- end }}
  selector:
    app: blocky
{{- end -}}