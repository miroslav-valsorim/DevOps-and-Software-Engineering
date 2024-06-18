job('Check Java version') {
    description('This is an example Jenkins job to check Java version created using Job DSL')
    
    // Set up a Git repository
    // scm {
    //     git {
    //         remote {
    //             url('https://github.com/your-repository.git')
    //             credentials('github-credentials-id')
    //         }
    //         branch('main')
    //     }
    // }
    
    // Define triggers
    triggers {
        scm('H/15 * * * *')  // Poll the SCM every 15 minutes
    }
    
    // Define steps
    steps {
        batchFile('java -version')
    }

}

// Create the view and add the job to it
listView('Java View') {
    description('This is an view containing Java jobs')
    jobs {
        names('Check Java version')
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}