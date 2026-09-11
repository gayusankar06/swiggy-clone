#!/bin/bash

DOCKER_USERNAME=$(aws ssm get-parameter \
  --name "/cicd/docker-credentials/username" \
  --query "Parameter.Value" \
  --output text \
  --region us-east-1)

IMAGE_TAG=$(cat /home/ec2-user/swiggy-app/image_tag.txt)

docker run -d \
  --name swiggy-app \
  -p 3000:3000 \
  --restart unless-stopped \
  "$DOCKER_USERNAME/swiggy-clone:${IMAGE_TAG}"
