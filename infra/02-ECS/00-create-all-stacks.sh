#!/bin/sh
date

echo "$0: Creating all infrastructure stacks for AWS ECS Fargate with nginx task definition  ..."
./01a-create-ecs-cluster-stack.sh ecs-cluster

# Check if the last command was successful
if [ $? -ne 0 ]; then
  echo "Previous command failed, exiting $0"
  exit 1
fi

./01b-create-ecs-task-stack.sh ecs-task

if [ $? -ne 0 ]; then
  echo "Previous command failed, exiting $0"
  exit 1
fi

./01c-create-ecs-service-stack.sh ecs-service

if [ $? -ne 0 ]; then
  echo "Previous command failed, exiting $0"
  exit 1
fi

date
echo "$0 Complete."
