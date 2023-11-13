def IMAGE_ID = ''

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
        stage('Build docker image')
        {
            steps
            {
                script
                {    
                    echo "Selected agent: ${env.AGENT_NAME}"
                    def customDockerImage = docker.build("test-image:tag", "-f Dockerfile .")
                    IMAGE_ID = sh(script: "docker inspect -f '{{.Id}}' test-image:tag", returnStdout: true).trim()
                    echo "IMAGE_ID - ${IMAGE_ID}"

                }
            }
        }
        stage('Build') {
            matrix {
                axes {
                    axis {
                        name 'PLATFORM'
                        values 'linux', 'windows'
                    }
                }
                stages {
                    stage('Build on ${PLATFORM}') {
                        agent any
                        steps {
                            script {
                                

                               docker.image("test-image:tag").inside {
                                   echo "${ls -l}"
                                   echo "pwd - ${pwd}"
                                   sh "chmod +x Java/docker_tag_push_image.sh"
                                    sh "Java/docker_tag_push_image.sh"
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Test') {
            agent any
            steps {
                script {
                    // Use the same Docker image for testing
                    docker.image("test-image:tag").inside {
                       echo "testing tst"
                    }
                }
            }
        }

        // Add more stages as needed
    }
    post
    {
        success{
                script{
                    
            sh "docker rmi -f ${IMAGE_ID}"
        }}}
    
}
