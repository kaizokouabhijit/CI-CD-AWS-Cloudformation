def buildList = ["Java"]   
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
                        name 'JAVA'
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
				    echo "${buildList[0]}"
				    echo "${JAVA}"
				    sh "chmod 777 ${JAVA}/gradlew"
				    sh "${JAVA}/gradlew -p ${JAVA} build"
				    sh "chmod 777 ${JAVA}/build/*"
				    
                             
	    }}}}}}
	}
    }
}

