
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
					echo "env.ENV  - ${env.ENV}"
					

					if (env.BRANCH_NAME == "main")
                    {
                        echo "branch name is main"
                        ENV = "stg"
                    }
					def lastCommitID = env.GIT_PREVIOUS_SUCCESSFUL_COMMIT ?: sh(script: 'git rev-parse HEAD', returnStdout: true).trim()

                    def revlist = sh(script: "git rev-list ${lastCommitID}~...HEAD", returnStdout: true).trim()
                    def commitList = revlist.split("\n") as List
		echo "commitList - ${commitList}"
					
					
					echo "ENV now - ${ENV}"
					echo "env.ENV now - ${env.ENV}"
		
		
	    }}}}}
