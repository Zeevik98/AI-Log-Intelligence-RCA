# AI-Powered Log Intelligence & RCA System

This repository provides a fully cloud-agnostic, Kubernetes-native AI pipeline for intelligent log analysis and root cause analysis (RCA). It uses:

- **NLP (Longformer)** for log summarization
- **LLM (Mixtral)** for final RCA insights
- **Zero Trust** security with RBAC, OPA, Istio, Falco
- **Terraform** & **Helm** for deployment
- **Autoscaling** at the pod and node levels

## Quick Start

1. Install [Terraform](https://www.terraform.io/) and [Helm](https://helm.sh/).
2. Run `scripts/deploy.sh` to provision infrastructure and deploy the charts.
3. Trigger on-demand log processing with `scripts/run_on_demand.sh`.

## Documentation

See the [docs/](docs/) folder for:
- [Architecture Overview](docs/architecture-overview.md)
- [Usage Guide](docs/usage-guide.md)
- [Security Best Practices](docs/security-best-practices.md)

## Architecture Overview

```ascii
                 +-------------+
                 |  External   |
                 |  Log Source |
                 +------^------+
                        |
                        | (logs periodically collected)
                        |
          +---------+    |    +---------+
          | NLP Cron|    |    | LLM Cron|
          |  Job    | -> | -> |  Job    |
          |(Longfr.)|         |(Mixtral)|
          +---------+         +---------+
                  \           /
                   \         /
            +-------v-------v-------+
            |   Persistent Volume   |
            |        (PV)          |
            +-----------^-----------+
                        |
                        | (structured logs + intermediate results)
                        |
            +-----------|-----------+
            |       AI Storage     |
            +-----------^-----------+
                        |
                        | (final RCA reports)
                        |
         +--------------+--------------+ 
         |  Monitoring & Dashboard   | 
         +--------------+--------------+ 
         |  Security (OPA/Falco)     |
         +--------------+--------------+ 
                        |
                  +-----v------+
                  |Kubernetes |
                  |  Cluster   |
                  +------------+

(Zero Trust: Istio mTLS + RBAC + NetworkPolicies)

```

1. External Log Source: Could be an external CI/CD system, servers, or security tools. Logs arrive to a place accessible by the cluster (e.g., an NFS share or object storage).
2. NLP Cron Job (Longformer): Periodically triggers, reads unstructured logs.
Summarizes or extracts key info, saves structured data to the Persistent Volume (PV).\
3. LLM Cron Job (Mixtral): Runs after NLP finishes, reading the structured logs from PV.\
Produces a final RCA (root cause analysis) or advanced insights.Saves the final report in the same PV or an AI Storage location.\
4. Zero Trust:Istio enforces mTLS, OPA ensures no privileged pods, Falco detects runtime anomalies.\
5. Monitoring & Dashboard: Prometheus + Grafana (for logs, resource usage, pipeline job metrics).Possibly integrates with a separate UI to visualize final RCA results.


