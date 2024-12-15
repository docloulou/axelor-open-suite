#!/bin/bash

echo "Stopping and removing Axelor containers..."
docker-compose down -v

# Remove the Axelor-specific containers if they still exist
echo "Removing Axelor containers..."
docker rm -f axelor-app axelor-postgres 2>/dev/null || echo "Containers already removed."

# Remove the Axelor-specific images
echo "Removing Axelor-specific images..."
docker rmi -f axelor-app:latest postgres:13 2>/dev/null || echo "Images already removed."

# Optionally remove dangling volumes
echo "Removing unused volumes related to Axelor..."
docker volume prune -f

echo "Axelor application and related containers/images removed successfully."
