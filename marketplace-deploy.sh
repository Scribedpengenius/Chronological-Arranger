#!/bin/bash

set -e

echo "Starting deployment..."

# Install dependencies (example: Node.js)
if [ -f package.json ]; then
  echo "Installing npm dependencies..."
  npm install
fi

# Build process (example: Node.js)
if [ -f package.json ]; then
  echo "Running build..."
  npm run build
fi

# Test process (optional)
if [ -f package.json ]; then
  echo "Running tests..."
  npm test
fi

# Deployment step (customize as needed)
echo "Deploying application..."
# Add your deployment commands here, e.g.:
# scp -r ./dist user@server:/path/to/app
# rsync -av ./dist/ user@server:/path/to/app

echo "Deployment completed successfully!"