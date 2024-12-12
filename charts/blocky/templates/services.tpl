{{- define "helm-charts.blocky.services" -}}
apiVersion: v1
kind: Service
metadata:
  name: blocky-service
  namespace: {{ .Release.Namespace }}
spec:
  type: LoadBalancer
  loadBalancerIP: {{ .Values.service.loadBalancerIP }}
  selector:
    app: blocky
  ports:
    - name: dns-tcp
      port: 53
      targetPort: 53
      protocol: TCP
    - name: dns-udp
      port: 53
      targetPort: 53
      protocol: UDP
---
apiVersion: v1
kind: Service
metadata:
  name: blocky-service
  namespace: {{ .Release.Namespace }}
spec:
  type: ClusterIP
  selector:
    app: blocky
  ports:
    - name: http
      port: 80
      targetPort: {{ .Values.deployment.httpPort | default 4000 }}
      protocol: TCP
    - name: https
      port: 443
      targetPort: {{ .Values.deployment.httpPort | default 4000 }}
      protocol: TCP
{{- end -}}