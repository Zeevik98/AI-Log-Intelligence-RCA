# Architecture Overview

## High-Level Diagram
(Include a diagram showing:
- NLP Job -> writes to PV -> LLM Job
- Zero Trust components
- Monitoring stack
)

## Key Components
- **NLP (Longformer)**: Summarizes raw logs
- **LLM (Mixtral)**: Correlates & generates final RCA
- **Zero Trust Security**: OPA, Istio, Falco, RBAC
- **Terraform + Helm**: Infrastructure + K8s manifests
