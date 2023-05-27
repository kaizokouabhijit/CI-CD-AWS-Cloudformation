image=$1
image_tag=$2
dir=$3

if [ "$image" == "" ]
then
    echo "Usage: $0 <image-name>"
    exit 1
fi


#chmod +x decision_trees/train
#chmod +x decision_trees/serve

# Get the account number associated with the current IAM credentials
account=$(aws sts get-caller-identity --query Account --output text)

aws sts get-caller-identity --query Account --output text

if [ $? -ne 0 ]
then
    exit 255
fi


# Get the region defined in the current configuration (default to us-east-2 if none defined)
region=$(aws configure get region)
region=${region:-us-east-2}


fullname="${account}.dkr.ecr.${region}.amazonaws.com/${image}:${image_tag}"

echo $fullname

# If the repository doesn't exist in ECR, create it.

aws ecr describe-repositories --repository-names "${image}" > /dev/null 2>&1

if [ $? -ne 0 ]
then
    aws ecr create-repository --repository-name "${image}" > /dev/null
fi
echo "Repo created on AWS"
# Get the login command from ECR and execute it directly
$(aws ecr get-login --region ${region} --no-include-email)

docker_file_loc="Lambda"
if [ -n "$3" ]
then
     docker_file_loc="./${docker_file_loc}"
fi


docker build -t ${image} ${docker_file_loc}
echo "Image built"
docker tag ${image} ${fullname}
echo "Image tagged"
docker push ${fullname}
echo "image pushed"



