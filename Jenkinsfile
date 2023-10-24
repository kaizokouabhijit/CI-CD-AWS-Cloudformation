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
	stages
	{
		stage("Build")
		{
			lista.each { commit ->
            if (commit in listb) {
                echo "Found and removing $commit from commitList"
                listb.remove(commit)
            }
        }
        
        echo "Modified commitList: ${listb}"
		}
	}
}





