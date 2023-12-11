#!/usr/bin/env bash

# Stop the existing container, if it exists
CURRENT_INSTANCE=$(sudo docker ps -q --filter ancestor="$IMAGE_NAME")
if [ "$CURRENT_INSTANCE" ]; then
  sudo docker stop $CURRENT_INSTANCE
fi

# Pull down the new image
sudo docker pull $IMAGE_NAME

# Remove the stopped container
if [ "$CURRENT_INSTANCE" ]; then
  sudo docker rm $CURRENT_INSTANCE
fi

# Run the new image
sudo docker run -e RAILS_ENV=$production  -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY -e SECRET_KEY_BASE=$SECRET_KEY_BASE -p 3000:3000 -d --name $CONTAINER_NAME $IMAGE_NAME bin/rails server -b 0.0.0.0 