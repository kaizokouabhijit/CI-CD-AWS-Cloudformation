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
				sh "docker rmi -f 29380ca8cfb4"
				sh "docker rmi -f 434560d5ea76"
				    
		echo "${buildLambdalist[0]}"
        }
    }
}
		    }}}}
