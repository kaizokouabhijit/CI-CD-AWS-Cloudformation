def buildLambdaList = ["Java"]   
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
                        values "Java"
}

		}
		    stages {
		 
                    stage('Build') {
                        steps{
			    dir('Java')
			    {
                            script {
                                echo "${JAVA_HOME}"
                                sh "docker images"
				    echo "${buildLambdaList[0]}"
				    echo "${lambdas}"
				    sh './gradlew build'
                             
	    }}}}}}
	}
    }
}

