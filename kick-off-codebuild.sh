#!/bin/bash

# Execute to verify that existing build works before continuing demo as a santity check

# ==== CONFIGURATION ====
PROJECT_NAME="my-nginx-ecr-build"     # Change this to your CodeBuild project name
SOURCE_VERSION="main"           # Optional: Git branch, commit ID, etc.

# ==== START BUILD ====
echo "Starting build for project: $PROJECT_NAME ..."
BUILD_ID=$(aws codebuild start-build \
  --project-name "$PROJECT_NAME" \
  --source-version "$SOURCE_VERSION" \
  --query 'build.id' \
  --output text)

if [ -z "$BUILD_ID" ]; then
  echo "Failed to start build."
  exit 1
fi

echo "Build started: $BUILD_ID"
