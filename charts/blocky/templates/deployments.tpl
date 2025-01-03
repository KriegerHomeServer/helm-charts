{{- define "helm-charts.blocky.deployments" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: blocky-app
  namespace: {{ .Release.Namespace }}
  labels:
    app: blocky
spec:
  replicas: {{ .Values.deployment.replicaCount | default 1 }}
  selector:
    matchLabels:
      app: blocky
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: blocky
    spec:
      containers:
        - name: application
          image: "{{ .Values.deployment.image.repository | default "spx01/blocky" }}:{{ .Values.deployment.image.tag | default "latest" }}"
          imagePullPolicy: {{ .Values.deployment.image.pullPolicy | default "IfNotPresent" }}
          resources:
            limits:
              cpu: {{ .Values.deployment.resources.limits.cpu | default "50m" }}
              memory: {{ .Values.deployment.resources.limits.memory | default "64Mi" }}
            requests:
              cpu: {{ .Values.deployment.resources.requests.cpu | default "50m" }}
              memory: {{ .Values.deployment.resources.requests.memory | default "64Mi" }}
          volumeMounts:
            - name: blocky-config
              mountPath: /app/config.yml
              subPath: config.yml
          ports:
            - containerPort: 53
              protocol: TCP
            - containerPort: 53
              protocol: UDP
            - containerPort: {{ .Values.deployment.httpPort | default 4000 }}
              protocol: TCP
          startupProbe:
            httpGet:
              path: /
              port: {{ .Values.deployment.httpPort | default 4000 }}
            failureThreshold: 10
            periodSeconds: 30
          livenessProbe:
            httpGet:
              path: /
              port: {{ .Values.deployment.httpPort | default 4000 }}
            periodSecond: 30
            failureThreshold: 1
      volumes:
        - name: blocky-config
          configMap:
            name: blocky-config
      restartPolicy: Always
{{- end -}}