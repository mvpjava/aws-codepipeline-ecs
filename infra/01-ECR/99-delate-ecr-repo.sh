#!/bin/sh

ECR_REPO_STACK_NAME=nginx-repo-stack

aws cloudformation delete-stack --stack-name $ECR_REPO_STACK_NAME

echo "Waiting for stack $ECR_REPO_STACK_NAME to be deleted ..."

aws cloudformation wait stack-delete-complete --stack-name $ECR_REPO_STACK_NAME

# Check if the last command was successful
 if [ $? -ne 0 ]; then
   echo "Previous command failed, exiting $0"
   exit 1
  fi

 echo "stack $ECR_REPO_STACK_NAME deleted"

 echo "script complete"
