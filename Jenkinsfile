def buildLambda = ["xyz"]

pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    environment {
        dockerImage = "your-custom-docker-image:tag"
        folderName = ""
        skipRemainingStages = false
        ENV = "qa"
        AGENT_NAME = ''
    }

    stages {

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

                }
            }
        }

        stage("Test docker container") {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    reuseNode true
                }
            }

            steps {
                script {
                    echo "here"
                    echo "pwd - ${pwd}"
                    def files = sh(script: "ls", returnStdout: true).trim()
                    echo "Files in the current directory: ${files}"
                //     dir("Java"){
                //         def files2 = sh(script: "ls", returnStdout: true).trim()
                //     echo "Files in the current directory: ${files2}"
                //     sh "chmod +x docker_tag_push_image.sh"
                //     sh "./docker_tag_push_image.sh"
                // }
                    buildLambda.each { name ->
                        parallel ("A. Build ${name}": {
                            echo "Building ${name}..."
                        }, "B. Test ${name}": {
                            echo "Testing ${name}..."
                        }, "C. Deploy ${name}": {
                            echo "Deploying ${name}..."
                        }, "D. testfinal ${name}": {
                            echo "testfinal ${name}..."})
                    }
                    
                }
            }
        }
                
    }
}
