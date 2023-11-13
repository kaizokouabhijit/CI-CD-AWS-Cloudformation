
REGION=$1
ENV=$2
BUILD_NUMBER=$3

if [ $# -ne 3 ]; then
    echo "Error: Script expects exactly three arguments: region, environment and build number"
    exit 1
fi

# aws lambdas
lambda[0]=aws
lambda[1]=lambda


# Flag variable to track failure
hasFailure=false

for i in "${!lambda[@]}"
do
    if [ "$hasFailure" = false ]; then
    
        ./${lambda[i]}/docker_push_image.sh ${lambda[i]} ${BUILD_NUMBER}
        



        if [ $? -eq 1 ]; then
            echo "accessible"
            hasFailure=true
        else
            echo "Seven"
            # aws cloudformation delete-stack --stack-name ot-${lambda[i]}
            echo "Eight"
            aws --region ${REGION} cloudformation deploy --template-file Lambda/template.yaml  --stack-name ot-${lambda[i]} --tags key=aws-common-resources --parameter-overrides ENV=${ENV}  --no-fail-on-empty-changeset --capabilities CAPABILITY_NAMED_IAM
            echo "Nine"
            aws cloudformation describe-stack-events --stack-name ot-${lambda[i]}
        fi

      
    fi

done






read -n 1 -s -r -p "Press any key to exit..."
