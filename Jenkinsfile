def buildLambdalist = ["xyz"]   

pipeline {
    environment
    {
        dockerImage = ""
    }
    agent any

    stages {

        stage('Build and test') {
           agent {
        dockerfile {
		filename 'Dockerfile'
                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
                }
		stages {
                    stage('Build') {
                        steps {
                            script {
                                
                                sh "docker images"
		echo "${buildLambdalist[0]}"
        }
    }
}
		    }}}}}
