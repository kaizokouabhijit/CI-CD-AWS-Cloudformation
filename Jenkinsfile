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
                    echo "current agent: ${env.AGENT_NAME}"
                    env.AGENT_NAME = currentBuild.rawBuild.builtOn
                    echo "Selected agent: ${env.AGENT_NAME}"
                    def customDockerImage = docker.build("test-image", "-f Dockerfile .")
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
                                

                               docker.image("test-image").inside {
                                    echo "testing build"
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
                    docker.image("test-image").inside {
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
                    node(env.AGENT_NAME){
            sh 'docker rmi -f test-image'
        }}}}
    
}
