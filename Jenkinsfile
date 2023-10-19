

pipeline {

    environment
    {
        dockerImage = ""
    }
   agent any
    stages {
        stage('Build and test') {
           
            matrix {
                axes {
                    axis {
                        name 'lambdas'
                        values "xyz"
}

		}
		    stages {
		 agent {
       		 dockerfile {
		filename 'Dockerfile'
                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
                }
                    stage('Build') {
                        steps {
                            script {
                                
                                sh "docker images"
                                
                                def buildLambdalist = []
                                buildLambdalist << "xyz" 
	    }}}}}
	}
    }
}
		









