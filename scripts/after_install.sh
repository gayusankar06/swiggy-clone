#!/bin/bash

DOCKER_USERNAME=$(aws ssm get-parameter \
  --name "/cicd/docker-credentials/username" \
  --query "Parameter.Value" \
  --output text \
  --region us-east-1)

DOCKER_TOKEN=$(aws ssm get-parameter \
  --name "/cicd/docker-credentials/password" \
  --with-decryption \
  --query "Parameter.Value" \
  --output text \
  --region us-east-1)

echo "$DOCKER_TOKEN" | docker login \
  -u "$DOCKER_USERNAME" \
  --password-stdin

IMAGE_TAG=$(cat /home/ec2-user/swiggy-app/image_tag.txt)

docker pull "$DOCKER_USERNAME/swiggy-clone:${IMAGE_TAG}"
