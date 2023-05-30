# CI-CD-AWS-Cloudformation

**Python**
**Java**
**Docker**
**AWS Lambda**
**AWS ECR**
**AWS CloudFormation**
**Shell Scripting**










**Error and fix**
The push refers to repository [313879473220.dkr.ecr.us-east-2.amazonaws.com/aws]
5f70bf18a086: Preparing
e157dbd381ff: Preparing
27c3566dae8a: Preparing
b8a36d10656a: Preparing
denied: Your authorization token has expired. Reauthenticate and try again.


Reauthenticate with ECR: Run the following command to refresh your authentication token for ECR:

command - aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 313879473220.dkr.ecr.us-east-2.amazonaws.com
This command retrieves a new authentication token using the AWS CLI and then uses it to log in to your ECR registry.

Retry the Docker push command: After reauthentication, you can try pushing the Docker image to ECR again by running the command you used previously.



docker run  --volume "C:\Users\abhijit.s\OnTarget\lambda-function:/code" -it unix_container /bin/bash - to mount a folder to the DOcker container
