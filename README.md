# CI-CD-AWS-Cloudformation

**Python**
**Java**
**Docker**
**AWS Lambda**
**AWS ECR**
**AWS CloudFormation**
**Shell Scripting**










**Error and fix**
The push refers to repository [account_id.dkr.ecr.us-east-2.amazonaws.com/aws]
5f70bf18a086: Preparing
e157dbd381ff: Preparing
27c3566dae8a: Preparing
b8a36d10656a: Preparing
denied: Your authorization token has expired. Reauthenticate and try again.


Reauthenticate with ECR: Run the following command to refresh your authentication token for ECR:

command - aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 313879473220.dkr.ecr.us-east-2.amazonaws.com
This command retrieves a new authentication token using the AWS CLI and then uses it to log in to your ECR registry.

Retry the Docker push command: After reauthentication, you can try pushing the Docker image to ECR again by running the command you used previously.



docker run  --volume "C:\pathtofolder:/pathtoworkdir" -it unix_container /bin/bash - to mount a folder to the DOcker container


If getting encoding/special characters related error &
If files have been created in windows and we are running the docker container with ubuntu, then before reading the files, we need to use dos2unix

apt install dos2unix
dos2unix /file_path


DockerInDocker

Act of creating other docker images inside a docker container. 

In the Dockerfile for the outside image
apt-get install -y docker-ce docker-ce-cli containerd.io awscli

**To run the container and mount the socket folder to the container 

docker run -it -v /var/run/docker.sock:/var/run/docker.sock my-docker-container


AWS CloudFormation yaml script related errors

ResourcePolicyGroups don't take tags.
Step functions don't take empty tags. They expect min length 1
No special characters allowed in param_config files for yaml. It's best to keep variable names all caps one word.

Before executing any command related to AWS, we need to first login to the account and also configure the region.
account=$(aws sts get-caller-identity --query Account --output text)
region=$(aws configure get region)
region=${region:-us-east-2}




























