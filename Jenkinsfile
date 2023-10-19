

pipeline {
    environment
    {
        dockerImage = ""
    }
   
    stages {
        stage('Build and test') {
           agent {
        dockerfile {
		filename 'Dockerfile'
                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
                }
            matrix {
                axes {
                    axis {
                        name 'lambdas'
                        values "xyz"
}

		}
	    }
	}
    }
}
		









