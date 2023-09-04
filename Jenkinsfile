// pipeline
// {
//     agent any
//     stages{
//         stage('Build')
//         {
//             steps
//             {
//             sh "echo ${env.CHANGE_AUTHOR}"
//             }
//         }
//         stage('Test')
//         {
//             steps
//             {
//             sh 'echo test stage'
//             }
//         }
//         stage('Deploy')
//         {
//             steps
//             {
//             sh 'python3 DevOps/AWS/main.py'
//             }
//         }
//     }
// }

pipeline {
    environment
    {
        dockerImage = ""
    }
    // agent { 
dockerfile true
args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
}
    agent {
		        docker { 
		          image 'gradle:7.6.1-jdk8' 
		          args '-u root -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.gradle:$HOME/.gradle -e IN_JENKINS_DOCKER_BUILD=true'
		          reuseNode true		          
		       }
		    }
    stages {
        stage('Test') {
            steps {
		    script
		    {
                dir('/var/jenkins_home/workspace/dockerContainerInsideBuildNode/Java')
                {
                pwd
                dockerImage = docker.build "testimage":"testtag"
                
                }
                pwd
            }
        }
    }}
}






















