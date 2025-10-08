- The CodeBuild project was created manually and is called "my-nginx-ecr-build"
  but this should eventually be automated for next iteration of development.
  Execute bash script kick-off-codebuild.sh  to ensure build works before continuing
  and check that ECR has new docker image generated with :latest tag and also with a version number (ex: :10)
 
- The buildspec.yml calls the 01-bootstrap-create-ecr-repo.sh  script



- the 99-delate-ecr-repo.sh script only works when ECR registry is not empty: TODO: Write loop to remove all images
