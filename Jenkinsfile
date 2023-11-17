def lista = ["abc", "xyz"]
def listb = ["abc", "xyz", "pqr", "mno"]

pipeline {
    environment {
        ENV = "qa"
    }

    agent any

    stages {
        stage("Build") {
            steps {
                script {
                    echo "listb - ${listb}"
                    echo "lista  - ${lista}"

                    // Loop over the listb
                    for (int i = 0; i < listb.size(); i++) {
                        def currentItem = listb[i]

                        // Modify listb by removing the first element
                        listb = listb.drop(1)

                        // Trigger the build with the modified listb
                        def buildResult = build job: "${JOB_NAME}", parameters: [
                            string(name: 'LISTB', value: listb.join(',')),
                            string(name: 'CURRENT_ITEM', value: currentItem)
                        ]

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
