#!/bin/sh
echo "Authenticate gcloud..."
gcloud auth activate-service-account --key-file=$GOOGLE_CLOUD_CREDENTIALS
gcloud config set project $GCP_PROJECT


#echo "Deploying [$BUILDKITE_PIPELINE_SLUG] workflows to [$GCP_PROJECT]"
#gcloud workflows deploy $BUILDKITE_PIPELINE_SLUG --location=asia-southeast1 --source=/app/$BUILDKITE_PIPELINE_SLUG.yaml
deloy_workflows() {
    echo "Deploying [$3][$1] workflows to [$2]"
    gcloud workflows deploy $1 --location=asia-southeast1 --source=$3
}


for FILE in workflows/*; 
    do deloy_workflows $(basename $FILE|sed 's/.yaml//' ) $GCP_PROJECT $FILE
done

