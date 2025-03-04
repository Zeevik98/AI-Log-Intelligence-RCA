#!/usr/bin/env bash
# This script triggers the NLP and LLM jobs manually, bypassing the Cron schedule.

echo "Triggering NLP job..."
kubectl create job nlp-on-demand --from=cronjob/nlp-job

echo "Waiting 15s, then triggering LLM job..."
sleep 15
kubectl create job llm-on-demand --from=cronjob/llm-job
