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
        stage("Build") {
            when 
            {
                expression {!booleanparam}
            }
            steps {
                script {
                    echo "listb - ${listb}"
                    echo "stringc - ${stringc}"

                    // Loop over the listb
                    for (int i = 0; i < listb.size(); i++) {
                        def currentItem = listb[i]

                        // Modify listb by removing the first element
                        listb = listb.drop(1)
                        echo "listb after drop - ${listb}"

                        // Check if STRINGC is provided as a parameter
                        def buildParams = []
                        if (params.STRINGC) {
                            stringc = params.STRINGC
                            
                        }
                        echo "stringc value afterwards - ${stringc}"
                        buildParams = [
                                string(name: 'STRINGC', value: currentItem),
                                booleanParam(name: 'BOOLEAN_PARAM', value: booleanparam)

                            ]

                        // Trigger the build with the modified listb and STRINGC
                        def buildResult = build job: "${JOB_NAME}", parameters: buildParams

                        // Check if the build was successful
                        if (buildResult == 'SUCCESS') {
                            echo "Build successful, continuing with the next item in listb."
                        } else {
                            error "Build failed, stopping the pipeline."
                        }
                    }
                }
            }
        }
    }
}
