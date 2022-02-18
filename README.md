# 🍀 GCP Workflows CICD POS

This pos provides basic solution to create cicd pipeline for gcp workflows using buildkite

### Stack
![Docker](https://img.shields.io/badge/docker-%2357A143.svg?style=for-the-badge&logo=docker&logoColor=white) ![Google_Cloud_Platform](https://img.shields.io/badge/Google_Cloud_Platform-%23000000.svg?style=for-the-badge&logo=google-cloud&logoColor=#FFD700) ![Buildkite](https://img.shields.io/badge/Buildkite-%23000000.svg?style=for-the-badge&logo=Buildkite&logoColor=#FFD700)

### Configs
```
#!/bin/sh
echo "Authenticate gcloud..."
gcloud auth activate-service-account --key-file=$GOOGLE_CLOUD_CREDENTIALS
gcloud config set project $GCP_PROJECT

deloy_workflows() {
    echo "Apply secrets..."
    sed -i -e "s/API_KEY_SECRET/$API_KEY/g" $3
    sed -i -e "s/ENV_VAL/$ENV_VAL/g" $3
    echo "Deploying [$3][$1] workflows to [$2]"
    gcloud workflows deploy $1 --location=asia-southeast1 --source=$3 #>/dev/null 2>&1
    echo "Deployed [$3][$1] workflows to [$2]"
}

for FILE in workflows/*; 
    do deloy_workflows $(basename $FILE|sed 's/.yaml//' ) $GCP_PROJECT $FILE
done
```


### Support
reachout to ortizmark905@gmail.com if you need help or want to develop related to this. 
