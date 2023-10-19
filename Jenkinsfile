def buildLambdalist = ["xyz"]   
pipeline {

    environment
    {
        dockerImage = ""
    }
   agent any
    stages {
        stage('Build and test') {
           
            matrix {

		    agent {
       		 dockerfile {
		filename 'Dockerfile'
                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
                }
		    
                axes {
                    axis {
                        name 'lambdas'
                        values "xyz"
}

		}
		    stages {
		 
                    stage('Build') {
                        steps {
                            script {
                                
                                sh "docker images"
				    echo "${buildLambdaList[0]}"
				    echo "${lambdas}"
                             
	    }}}}}
	}
    }
}

