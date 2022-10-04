
pipeline {
    agent any
     tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }
    stages {
        stage("Checkout code") {
            steps {
              git branch: 'main', url: 'https://github.com/shivam779823/CICD-jenkins-sonarqube--mvn.git'  
            }
        }

        
              stage('Quality Gate Statuc Check'){
                steps{
                      script{
                    withSonarQubeEnv(credentialsId: 'sonar-key') { 
                            sh "mvn sonar:sonar"
                       }
                      timeout(time: 1, unit: 'HOURS') {
                      def qg = waitForQualityGate()
                      if (qg.status != 'OK') {
                           error "Pipeline aborted due to quality gate failure: ${qg.status}"
                      }
                    }
		                    sh "mvn clean install"
                  }
                }

            }
             }  
              }       
          





