# Usage Guide

## Deployment Steps
1. `terraform init && terraform apply` in `infrastructure/`
2. `helm install log-rca charts/log-rca-pipeline -f custom-values.yaml`
3. `helm install security charts/security -f security-values.yaml`

## On-Demand vs Scheduled
- **On-Demand**: Run `scripts/run_on_demand.sh`
- **Scheduled (24h)**: Configure CronJobs in `charts/log-rca-pipeline/values.yaml`

## Retrieving Results
- Check final RCA output in the Persistent Volume or from the `llm-job` logs.
- For security events (Falco, OPA), see `charts/security` docs.

## Log Storage Strategy

By default, our pipeline expects logs to be accessible at runtime. There are two approaches:

1. **On-Demand Fetch**: The NLP stage mounts an external volume or retrieves logs directly from an external source each time it runs. In this case, logs are not permanently stored in the cluster.
2. **Cluster-Local Copy**: The user copies logs into the `/data/logs` directory (Persistent Volume) prior to the NLP job. The logs remain in the cluster only until processed and can be deleted afterward.

**Important**: This system does not enforce long-term log retention. If compliance or audit requirements demand it, the user must configure a separate archival solution.
