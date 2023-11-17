def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]
def stringc = ""
def booleanparam = true

pipeline {
    environment {
        ENV = "qa"
    }

    agent any

    stages {
        stage("Initialise")
        
        {
            steps
            {
                script
                {
                    echo "in initialise step"
                    echo "booleanparam = ${booleanparam}" 
                    
                    if (params.STRINGC) {
                            stringc = params.STRINGC
                        booleanparam = params.BOOLEAN_PARAM
                            
                        }
                    echo "stringc = ${stringc}"
                    echo "booleanparam = ${booleanparam}" 
                    
                }
                
            }
        }
      
        stage("Build") {
            when 
            {
                expression {booleanparam}
            }
            steps {
                script {
                    echo "listb - ${listb}"
                    echo "stringc - ${stringc}"

                    // Loop over the listb
                    while(listb.size()>0) {
                        def currentItem = listb[0]
                        echo "current item - ${currentItem}"
                        booleanparam = false
                        echo "booleanparam - ${booleanparam}"
                        // Modify listb by removing the first element
                        listb = listb.drop(1)
                        echo "listb after drop - ${listb}"

                        // Check if STRINGC is provided as a parameter
                        def buildParams = []
                        
                        echo "stringc value afterwards - ${stringc}"
                        buildParams = [
                                string(name: 'STRINGC', value: currentItem),
                                booleanParam(name: 'BOOLEAN_PARAM', value: booleanparam)

                            ]

                        // Trigger the build with the modified listb and STRINGC
                        build job: "${JOB_NAME}", parameters: buildParams
                    }
                    booleanparam = true
                }
            }

        }
        stage("Test")
        {
            when {
                expression {!booleanparam}
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
                
                stage ("Testing inner stages")
                {
                    steps{
                        script{
                            echo "Testing inner stages"
                        }
                    }
                }
            }
            
        }
    }
    post {
    always {
      sendMail()
    }}
}

def sendMail() {
  script {
  		  def mailRecipients = ''
          def jobName = currentBuild.fullDisplayName
          emailext(
            subject: "[Jenkins] ${jobName}",
            body: '''${SCRIPT, template="groovy-html.template"}''',
            mimeType: 'text/html',
            attachLog: true,
            to: "${mailRecipients}",
            replyTo: "${mailRecipients}",
            recipientProviders: [culprits(), brokenTestsSuspects(), brokenBuildSuspects(), requestor()])
    }
}
