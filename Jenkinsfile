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
                                
                                def buildLambdalist = []
                                buildLambdalist << "xyz" 
	    }}}}}
	}
    }
}
		









                    stage('Build') {
                        steps {
                            script {
                                
                                sh "docker images"
				sh "docker rmi -f 434560d5ea76"
				    
		echo "${buildLambdalist[0]}"
        }
    }
}
		    }}}}
