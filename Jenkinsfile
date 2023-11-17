
def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]

pipeline
{
	environment
	{
		ENV = "qa"
	}
agent {
                dockerfile {
                    filename 'Dockerfile'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    reuseNode true
                }
            }
	stages
	{
		stage("Build")
		{
	steps
			{
				script
				{
					echo "listb - ${listb}"
					echo "lista  - ${lista}"
					

				
		
		
	    }}}}}
