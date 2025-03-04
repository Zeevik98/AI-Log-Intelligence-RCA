# Security Best Practices

## Zero Trust Model
- RBAC: Minimal privileges for each ServiceAccount
- OPA/Gatekeeper: Enforce no-privileged containers, mandatory resource limits
- Istio mTLS: Encrypt service-to-service traffic
- Falco: Real-time runtime security alerts

## Compliance
- Encrypt etcd for secrets
- Use ephemeral nodes (Spot Instances) with PodDisruptionBudgets
- Rotate credentials & images regularly
