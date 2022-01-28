#!/bin/sh
echo "Authenticate gcloud..."
gcloud auth activate-service-account --key-file=$GOOGLE_CLOUD_CREDENTIALS
gcloud config set project $GCP_PROJECT

deloy_workflows() {
    echo "Apply secrets..."
    sed -i -e 's/API_KEY_SECRET/$API_KEY/g' $1
    echo "Deploying [$3][$1] workflows to [$2]"
    gcloud workflows deploy $1 --location=asia-southeast1 --source=$3
}

for FILE in workflows/*; 
    do deloy_workflows $(basename $FILE|sed 's/.yaml//' ) $GCP_PROJECT $FILE
done

echo "API_KEY: $API_KEY"

