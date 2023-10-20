def buildList = ["Java", "DevOps"]
def testName = "test"
pipeline {

    environment
    {
        dockerImage = ""
    }
   agent any
    stages {
 stage("Build stage")
        {
		agent {
       		 dockerfile {
		filename 'Dockerfile'
		args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
                }
		
            steps
            {
                script{
		sh "dir"
		sh "pwd"
                }
            }
        }
	    
	    stage('Build and test') {
           
            matrix {
		axes {
                    axis {
                        name 'JAVA'
                        values "Java", "DevOps"
}

		}
		    stages {
		 
                    stage('Build') {
                        steps{

			    
                            script {
		sh "dir"
		sh "pwd"
				    }
				    
                             
	    }}}}}
	}
    }

