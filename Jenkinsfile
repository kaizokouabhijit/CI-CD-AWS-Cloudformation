
def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]

pipeline
{
	environment
	{
		ENV = "qa"
	}
agent any
	stages
	{
		stage("Build")
		{
	steps
			{
				script
				{
					echo "ENV - ${ENV}"
					echo "env.ENV - ${env.ENV}"
					

					if (env.BRANCH_NAME == "main")
                    {
                        echo "branch name is main"
                        ENV = "stg"
                    }

					echo "ENV now - ${ENV}"
					echo "env.ENV now - ${env.ENV}"
		def lastCommitID = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT ?: env.GIT_PREVIOUS_COMMIT
                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                    def commitList = revlist.split("\n") as List
		echo "${commitList}"
                    def successfulCommits = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT
                    echo "${successfulCommits}"
                    
                    if (successfulCommits in commitList) {
                    echo "Found and removing $successfulCommits from commitList"
                    commitList= commitList - successfulCommits
			     
				}
			
					echo "${commitList}"
					if (commitList.isEmpty()) {
                        echo "Commit list is empty. Exiting the pipeline."
                        return}
					for (commit in commitList) {
                        def commits = sh(script: "git show --name-only --pretty=format:  ${commit}", returnStdout: true).trim()
						echo "here"
			currentBuild.result = 'SUCCESS'
						echo "now here"
			return
						echo "this shouldn't get printed"
                        for (key in commits.split("\n")) {
				if (key =~ /(\.py|\.java)$/)
				{
					echo "$key"
					sh "chmod 777 Java/docker_tag_push_image.sh"
				sh "Java/docker_tag_push_image.sh ${env.BRANCH_NAME} ${env.BUILD_NUMBER}"
				}}}
		
	    }}}}}
