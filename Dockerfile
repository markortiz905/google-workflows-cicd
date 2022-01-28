FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

#deafult values
ARG GCP_REGION=asia-southeast1
ARG GCP_PROJECT=scg-hip-dev

ENV GCP_REGION $GCP_REGION
ENV GCP_PROJECT $GCP_PROJECT
ENV GOOGLE_CLOUD_CREDENTIALS /.google-credentials

ENTRYPOINT chmod +x /app/entrypoint.sh && /app/entrypoint.sh
