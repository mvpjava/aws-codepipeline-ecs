#!/bin/sh

echo "$0: Creating ECR Repo"
./create-ecr-repo-stack.sh nginx-repo-stack

# Check if the last command was successful
if [ $? -ne 0 ]; then
  echo "Previous command failed, exiting $0"
  exit 1
fi

echo "$0 Complete."
