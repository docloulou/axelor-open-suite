#!/bin/bash

# Build and start the containers
echo "Building and starting the containers..."

# Build the app
docker-compose up --build -d

# Check if the containers are running
docker ps
