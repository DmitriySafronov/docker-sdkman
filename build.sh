#!/bin/bash

VERSION="latest"

set -e

echo "> 1. Building Docker image"
echo ""
docker build -t zimniy/sdkman:$VERSION .

#echo ""
#echo "> 2. Publishing Docker image to Docker Hub"
#echo ""
#docker login -u $DOCKER_USER -p $DOCKER_PASS
#docker push zimniy/sdkman:$VERSION
