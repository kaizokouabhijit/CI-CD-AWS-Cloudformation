

aws cloudformation delete-stack --stack-name ot-${ENV}-aws-common-resources


aws --region ${REGION} cloudformation deploy --template-file Lambda/template.yaml  --stack-name ot-${ENV}-aws-common-resources --tags key=aws-common-resources --parameter-overrides ENV=${ENV}  --no-fail-on-empty-changeset --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stack-events --stack-name ot-qa-aws-common-resources


read -n 1 -s -r -p "Press any key to exit..."
