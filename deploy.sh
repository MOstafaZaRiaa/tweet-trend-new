#!/bin/bash

# Check if there are any running containers
running_containers=$(docker ps -a -q)

if [ -n "$running_containers" ]; then
  echo "Stopping and removing running containers..."

  # Stop all running containers
  docker stop $running_containers

  # Remove all containers
  docker rm $running_containers

  docker run -dt --name tweet -p 8000:8000 zariaa.jfrog.io/tweet-trend-docker-local/tweet-trend:2.1.2
else
  echo "No running containers found."
  docker run -dt --name tweet -p 8000:8000 zariaa.jfrog.io/tweet-trend-docker-local/tweet-trend:2.1.2
fi

# Create a new container from the specified image

echo "New container created from the image 'your_image_name'."
