def buildLambda = []
def folderName = ""
def javaLambda = ["config-resolution", "endpoint-trigger"]
def deployLambda = []
def skipRemainingStages = false

pipeline {
    environment {
        dockerImage = ""
        folderName = ""
        skipRemainingStages = false
        ENV = "qa"
        REGION = "us-east-2"
        AUTHPWD = credentials('AUTHPWD')
        VAULTTOKEN = credentials('VAULTTOKEN')
    }
    // agent { label 'tvsopsjenkins03.cloud.operative.com || tvsopsjenkins02.cloud.operative.com' }
	agent any

    stages {
        stage("Build Docker Image")
        {
             steps {
                            script {
                                docker.build("container-env:ontarget", '.')
                            }
                        }
        }
        stage("changeset") {
            steps {
                script {
                    def lastCommitID = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT ?: sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                    def commitList = revlist.split("\n") as List

                        if (lastCommitID in commitList) {
                            echo "Found and removing $lastCommitID from commitList"
                            commitList = commitList - lastCommitID
                        }
                    
                    echo "commit list - ${commitList}"
                    
                    for (commit in commitList) {
                        def commits = sh(script: "git show --name-only --pretty=format:  ${commit}", returnStdout: true).trim()
                        for (key in commits.split("\n")) {
                            if (key =~ /(\.py|\.java|\.yaml|deployment_param_config|\.sh)$/) {
                                folderName = key.split("/")[0]
                                if (!buildLambda.contains(folderName)) {
                                    buildLambda.add(folderName)
                                }
                            }
                        }
                    }
                    echo "buildLambda - ${buildLambda}"
                    if (buildLambda.isEmpty()) {
                        skipRemainingStages = true
                    }

                }
            }
        }
        stage('Build, test and Deploy') {
            when {
                expression {
                    !skipRemainingStages
                }
            }
            matrix {
                // agent {
                //     dockerfile {
                //         filename 'Dockerfile'
                //         args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                //         reuseNode true
                //     }
                // }
                axes {
                    axis {
                        name 'lambdas'
                        values "data-ingestor-nielsen", "inference", "config-resolution", "inference-data-enrichment", "ingest-payload-processor", "load-csv-to-rds", "aos-integration", "ingest-online-features", "update-forecast-with-actual", "job-monitoring", "partial-enrichment", "hutput-forecasting", "endpoint-trigger"
                    }
                }
                stages {
                    stage('Build')
                    agent {
                            docker {
                                image "container-env:ontarget"
                                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                                reuseNode true
                            }
                        }
                     {
                        
                        steps {
                            script {
                                if (buildLambda.contains(lambdas) && !(javaLambda.contains(lambdas))) {
                                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'ontarget-aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                                        sh "echo building docker image and deploying it to ECR"
                                        sh "chmod 777 ${lambdas}/docker_tag_push_image.sh"
                                        sh "${lambdas}/docker_tag_push_image.sh ${lambdas} ${env.BUILD_NUMBER} ${REGION}"
                                    }
                                } else if (javaLambda.contains(lambdas) && buildLambda.contains(lambdas)) {
                                    withCredentials([[$class: "AmazonWebServicesCredentialsBinding", accessKeyVariable: "AWS_ACCESS_KEY_ID", credentialsId: "ontarget-aws", secretKeyVariable: "AWS_SECRET_ACCESS_KEY"]]) {
                                        sh "echo building jar"
                                        sh "chmod 777 ${lambdas}/gradlew"
                                        sh "${lambdas}/gradlew -p ${lambdas} build"
                                        sh "chmod 777 ${lambdas}/build/*"
                                        sh "chmod 777 ${lambdas}/docker_tag_push_image.sh"
                                        sh "${lambdas}/docker_tag_push_image.sh ${lambdas} ${env.BUILD_NUMBER} ${REGION}"
                                    }
                                } else {
                                    // Do nothing
                                }
				    if (buildLambda.contains(lambdas)) {
                                    PARAMS = sh (
                                        script: "echo \$(cat ${lambdas}/deployment_param_config)",
                                        returnStdout: true
                                    ).trim()

                                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'ontarget-aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                                        sh "aws --region ${REGION} cloudformation deploy --template-file  ${lambdas}/cloudformation.yaml  --stack-name ot-${ENV}-${lambdas} --tags ontarget=${lambdas} --parameter-overrides ${PARAMS} TAG=${env.BUILD_NUMBER} ENV=${ENV} AUTHPWD=${AUTHPWD} VAULTTOKEN=${VAULTTOKEN} AUTHPASSWORD=${AUTHPWD} --no-fail-on-empty-changeset --capabilities CAPABILITY_NAMED_IAM"
                                    }
                                } else {
                                    // Do nothing
                                }
                            }
                        }
                    }}}}}}
                   
