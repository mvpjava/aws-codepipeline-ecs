#!/bin/bash 

# validate-cfn-template.sh
#
# This script validates an AWS CloudFormation template using the AWS CLI.
# It expects the template file path as its first argument.

# Check if a template file path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <cloudformation-template-file>"
  echo "Example: $0 my-template.json"
  echo "         $0 templates/my-app-stack.yaml"
  exit 1
fi

 $1
TEMPLATE_FILE="$1"

echo "Attempting to validate CloudFormation template: $TEMPLATE_FILE"
echo "-----------------------------------------------------"

# Check if the template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Error: Template file '$TEMPLATE_FILE' not found."
  exit 1
fi

# Validate the CloudFormation template using AWS CLI
# The '2>&1' redirects stderr to stdout, so both success and error messages
# from the AWS CLI command can be captured by the 'aws' variable.
# The 'set +e' and 'set -e' ensure that the script doesn't exit immediately
# on the 'aws' command failure, allowing us to capture the output and status.
set +e
VALIDATION_OUTPUT=$(aws cloudformation validate-template --template-body "file://$TEMPLATE_FILE" 2>&1)
VALIDATION_STATUS=$? # Capture the exit status of the previous command
set -e

# Check the validation status
if [ "$VALIDATION_STATUS" -eq 0 ]; then
  echo "Validation SUCCESS:"
  echo "$VALIDATION_OUTPUT"
  echo "-----------------------------------------------------"
  echo "Template '$TEMPLATE_FILE' is valid."
  exit 0
else
  echo "Validation FAILED:"
  echo "$VALIDATION_OUTPUT"
  echo "-----------------------------------------------------"
  echo "Template '$TEMPLATE_FILE' is invalid. Please review the errors above."
  exit 1
fi

