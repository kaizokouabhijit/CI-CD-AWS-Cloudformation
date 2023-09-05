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
                dir('/var/jenkins_home/workspace/dockerContainerInsideBuildNode/Java')
                {
                sh "docker build -t testimage ."
		sh "docker rmi -f testimage"
                }
                pwd
            }
        }
    }
    }
}






















