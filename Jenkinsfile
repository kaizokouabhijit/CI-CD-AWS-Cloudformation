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
    agent {
                dockerfile {
		filename 'Dockerfile'
                args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
		reuseNode true
                }
    }
    // agent {
		  //       docker { 
		  //         image 'gradle:7.6.1-jdk8' 
		  //         args '-v /var/run/docker.sock:/var/run/docker.sock'
		  //         reuseNode true		          
		  //      }
		  //   }
    stages {
        stage('Test') {
            steps {
		    script
		    {
                dir('/var/jenkins_home/workspace/dockerContainerInsideBuildNode/code')
                {

		sh "git clone https://github.com/kaizokouabhijit/MySQL.git"

		sh "dir"

                                def buildLambdalist = []
                                buildLambdalist << "config-resolution"



                                echo "reached here"
                                sh 'export DEBIAN_FRONTEND=noninteractive && echo 9 | apt-get update && apt-get install -y awscli'
                                sh "apt-get install dos2unix"
                                sh "dir"
                                echo "now here"
                                
                }
                pwd
            }
        }
    }
    }
}












