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
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                dir('/var/jenkins_home/workspace/dockerContainerInsideBuildNode/Java')
                {
                sh "pwd"
                dockerImage = docker.build "testimage":"testtag"
                }
                sh "docker --version"
                sh "dir"
                sh "pwd"
            }
        }
    }
}






















