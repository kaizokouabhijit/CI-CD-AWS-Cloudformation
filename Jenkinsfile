
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
		def lastCommitID = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT ?: env.GIT_PREVIOUS_COMMIT
                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                    def commitList = revlist.split("\n") as List
		echo "${commitList}"
                    def successfulCommits = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT
                    echo "${successfulCommits}"
                    successfulCommits.each { commit ->
                    if (commit in commitList) {
                    echo "Found and removing $commit from commitList"
                    commitList= commitList - commit
			     
				}
			}
					echo "${commitList}"
					if (commitList.isEmpty()) {
                        echo "Commit list is empty. Exiting the pipeline."
                        return}
					for (commit in commitList) {
                        def commits = sh(script: "git show --name-only --pretty=format:  ${commit}", returnStdout: true).trim()

                        for (key in commits.split("\n")) {
				if (key =~ /(\.py|\.java)$/)
				{
					echo "$key"
					sh "chmod 777 Java/docker_tag_push_image.sh"
				sh "Java/docker_tag_push_image.sh"
				}}}
		
	    }}}}}
