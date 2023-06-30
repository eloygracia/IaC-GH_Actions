#!/bin/bash
# Update the package lists for upgrades and new package installations
sudo yum update -y

# Install Docker
sudo yum install docker -y

# Start Docker service
sudo service docker start

# Add the ec2-user to the Docker group to execute Docker commands
sudo usermod -a -G docker ec2-user

# Pull the Docker image from GitHub container registry
docker pull ghcr.io/2000ghz/hello-2048/hello-2048

# Run the Docker container
docker run -td --rm -p 80:80 ghcr.io/2000ghz/hello-2048/hello-2048