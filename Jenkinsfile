pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    environment {
        dockerImage = ""
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
                agent {
                    docker {
                        image 'your-custom-docker-image:tag'
                        args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    }
                }
                stages {
                    stage('Build on ${PLATFORM}') {
                        steps {
                            // Your build steps here, you can use the PLATFORM variable
                        }
                    }
                }
            }
        }

        stage('Test') {
            agent any
            steps {
                // Your test steps here
            }
        }

        // Add more stages as needed
    }
}
