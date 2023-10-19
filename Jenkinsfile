def buildLambdaList = ["xyz"]   
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

