{{- define "helm-charts.blocky.role-bindings" -}}
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cronjob-sa-full-access-configmaps
  namespace: {{ .Release.Namespace }}
subjects:
- kind: ServiceAccount
  name: cronjob-sa
  namespace: {{ .Release.Namespace }}
roleRef:
  kind: Role
  name: full-access-configmaps
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cronjob-sa-rollout-restart-deployments
  namespace: {{ .Release.Namespace }}
subjects:
- kind: ServiceAccount
  name: cronjob-sa
  namespace: {{ .Release.Namespace }}
roleRef:
  kind: Role
  name: rollout-restart-deployments
  apiGroup: rbac.authorization.k8s.io
{{- end -}}