pipeline
{
    agent any
    stages{
        stage('Build')
        {
            steps
            {
            sh "echo ${env.CHANGE_AUTHOR}"
            }
        }
        stage('Test')
        {
            steps
            {
            sh 'echo test stage'
            }
        }
        stage('Deploy')
        {
            steps
            {
            sh 'python3 DevOps/AWS/main.py'
            }
        }
    }
}
