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

if [ $? -ne 0 ]
then
    exit 255
fi


# Get the region defined in the current configuration (default to us-east-2 if none defined)
region=$(aws configure get region)
region=${region:-us-east-2}

echo "one"

fullname="${account}.dkr.ecr.${region}.amazonaws.com/${image}:${image_tag}"

echo "two"
# If the repository doesn't exist in ECR, create it.

aws ecr describe-repositories --repository-names "${image}" > /dev/null 2>&1

if [ $? -ne 0 ]
then
    aws ecr create-repository --repository-name "${image}" > /dev/null
fi
echo "Three"
# Get the login command from ECR and execute it directly
$(aws ecr get-login --region ${region} --no-include-email)

docker_file_loc="aws"
if [ -n "$3" ]
then
     docker_file_loc="${dir}/${docker_file_loc}"
fi
echo "Four"
docker build -t ${image} ${docker_file_loc}
echo "Five"
docker tag ${image} ${fullname}
echo "Six"
docker push ${fullname}

