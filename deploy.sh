#!/bin/bash

# Step 1: Build Docker image
echo "Building Docker image..."
docker build -t my-app:latest .

# Step 2: Push the Docker image to a container registry (optional)
# If you're using a private registry, make sure you're logged in before pushing
# docker push my-app:latest

# Step 3: Run Jenkins job (assuming Jenkins is set up and the Jenkinsfile exists)
echo "Triggering Jenkins job..."
# You can use Jenkins CLI or curl to trigger the Jenkins pipeline. Here's an example using curl:
# Replace `<jenkins_url>` with your Jenkins server URL and `<job_name>` with the Jenkins job name.
curl -X POST -u "your-username:your-api-token" "http://<jenkins_url>/job/<job_name>/build"

# Step 4: Apply Kubernetes configuration
echo "Applying Kubernetes configuration..."
kubectl apply -f kubernetes.yaml

# Optional: Check the status of the Kubernetes deployment
echo "Checking deployment status..."
kubectl get pods

echo "Deployment completed!"
