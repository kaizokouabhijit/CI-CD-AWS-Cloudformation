pipeline {
    agent none
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    environment {
        dockerImage = "your-custom-docker-image:tag"
        folderName = ""
        skipRemainingStages = false
        ENV = "qa"
    }

    stages {
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
                        agent {
                            label 'your-docker-agent-label'
                        }
                        steps {
                            script {
                                def customDockerImage = docker.build("${dockerImage}-${PLATFORM}", "-f Dockerfile .")

                                customDockerImage.inside {
                                    echo "testing build"
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Test') {
            agent {
                label 'your-docker-agent-label'
            }
            steps {
                script {
                    // Use the same Docker image for testing
                    docker.image("${dockerImage}-linux").inside {
                       echo "testing tst"
                    }
                }
            }
        }

        // Add more stages as needed
    }
}
