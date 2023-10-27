// def buildList = ["Java", "DevOps"]
// def testName = "test"
// pipeline {

//     environment
//     {
//         dockerImage = ""
//     }
//    agent any
//     stages {
//  stage("Build stage")
//         {
// 		agent {
//        		 dockerfile {
// 		filename 'Dockerfile'
// 		args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
// 		reuseNode true
//                 }
//                 }
		
//             steps
//             {
//                 script{
// 			sh "dir"
// 		sh "pwd"


// 			def lastCommitID = env.GIT_PREVIOUS_COMMIT
//                     def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
//                     def commitList = revlist.split("\n")
//                     // commitList.drop(1)
//                     echo "GIT_PREVIOUS_SUCCESSFUL_COMMIT: ${env.GIT_PREVIOUS_SUCCESSFUL_COMMIT}"
//                     echo "commitList - ${commitList}"
//                 }
//             }
//         }
	    
// 	    stage('Build and test') {
           
//             matrix {
// 		axes {
//                     axis {
//                         name 'JAVA'
//                         values "Java", "DevOps"
// }

// 		}
// 		    stages {
		 
//                     stage('Build') {
//                         steps{

			    
//                             script {
// 		sh "dir"
// 		sh "pwd"
// 				    }
				    
                             
// 	    }}}}}
// 	}
//     }

def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]

pipeline
{
agent any
	stages
	{
		stage("Build")
		{
	steps
			{
				script
				{
		def lastCommitID = env.GIT_PREVIOUS_COMMIT
                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                    def commitList = revlist.split("\n") as List
		echo "${commitList}"
                    def successfulCommits = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT.tokenize('\n')
                    echo "GIT_PREVIOUS_SUCCESSFUL_COMMIT: ${successfulCommits}"
                    successfulCommits.each { commit ->
                    if (commit in commitList) {
                    echo "Found and removing $commit from commitList"
                    commitList= commitList - commit
			     
				}
			}
					echo "${commitList}"
					if (commitList.isEmpty()) {
                        echo "Commit list is empty. Exiting the pipeline."
                        return
					for (commit in commitList) {
                        def commits = sh(script: "git show --name-only --pretty=format:  ${commit}", returnStdout: true).trim()

                        for (key in commits.split("\n")) {
				if (key  =~ /(\.py|\.java|\.yaml)$/)
				{
					echo "$key"}}}
		}
	    }}}}}
