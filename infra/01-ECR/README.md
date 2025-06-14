
- The buildspec.yml calls the 01-bootstrap-create-ecr-repo.sh  script

- the 99-delate-ecr-repo.sh script only works when ECR registry is not empty: TODO: Write loop to remove all images
