# Установка vault-secret-webhook:
kubectl create namespace vault-infra

kubectl label namespace vault-infra name=vault-infra

helm upgrade --install --wait vault-secrets-webhook \
oci://ghcr.io/bank-vaults/helm-charts/vault-secrets-webhook --namespace vault-infra

# Кладем в Vault новый секрет:
«vault kv put secret/services/service-test SECRET_SERVICE_KEY=cxcpopvnok4oi37j312n8jkn»


# Передача в env секрета из Vault средставами Webhook
env:
  - name: SECRET_SERVICE_KEY
    value: vault:secret/data/services/service-test#SECRET_SERVICE_KEY
