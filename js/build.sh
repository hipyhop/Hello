#!/bin/bash

# Set some common variables that can be overriden by environment variables
APP_NAME="node_app"
DOCKER_TAG="${TAG:-latest}"
DOCKER_REGISTRY="${DOCKER_REGISTRY:-localhost:5000}"

LOCAL_TAG=$APP_NAME:$DOCKER_TAG
REMOTE_TAG=$DOCKER_REGISTRY/$APP_NAME:$DOCKER_TAG

# Build the docker image
docker build -t $LOCAL_TAG -t $REMOTE_TAG .

# Check the exit code, and exit with non-negative exit-code if `docker build` failed
if [ $? -ne 0 ]
then
  echo "Failed to build docker image, see output for more details" >&2
  exit 1
fi

# If built successfully, push the resulting image to the $DOCKER_REGISTRY
# No need to check exit status here as it's the last statement in a bash script
docker push $DOCKER_REGISTRY/$APP_NAME:$DOCKER_TAG
