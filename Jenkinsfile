
def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]
def ENV = "qa"
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
					if(env.BRANCH_NAME == "main")
                    {
                        ENV ="stg"
                        echo "in master-standby branch, setting ENV to ${ENV} "
                    }
					
					
					
					echo "ENV now - ${ENV}"
		
		
	    }}}
	stage("Testing")
		{
			steps
			{
				script
				{
					echo "In Testing stage, value of ENV is ${ENV}"
					
				}
			}
		}
	}}
