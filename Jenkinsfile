
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
					checkout scm
					def changedFiles = sh(script: 'git diff --name-only HEAD^ HEAD', returnStatus: true)
                   			 echo "Changed files: ${changedFiles}"
					
					
					echo "ENV now - ${ENV}"
					echo "env.ENV now - ${env.ENV}"
		
		
	    }}}}}
