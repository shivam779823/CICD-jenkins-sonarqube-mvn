
// pipeline {
//     agent any
//      tools {
//         // Install the Maven version configured as "M3" and add it to the path.
//         maven "maven"
//     }
//     stages {
//         stage("Checkout code") {
//             steps {
//               git branch: 'main', url: 'https://github.com/shivam779823/CICD-jenkins-sonarqube--mvn.git'  
//             }
//         }

        
//               stage('Quality Gate Statuc Check'){
//                 steps{
//                       script{
//                     withSonarQubeEnv(credentialsId: 'sonar-key') { 
//                             sh "mvn sonar:sonar"
//                        }

//                         timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
//                     def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
//                     if (qg.status != 'OK') {
//                     error "Pipeline aborted due to quality gate failure: ${qg.status}"
//                     }
//                 }
//                 sh "mvn clean install"

//                   }
//                 }


//              stage("docker build") {
//                 steps{
//                     sh "echo success"
//                 }
//              }
//     }  

//  }       
          
// }



pipeline {
   
     agent any
     tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }
    stages {
        stage('SCM') {
            steps {
               git branch: 'main', url: 'https://github.com/shivam779823/CICD-jenkins-sonarqube--mvn.git'  

            }
        }
        stage('SonarQube analysis') {
            steps {
                  script{
                     withSonarQubeEnv(credentialsId: 'sonar-key') { 
                            sh "mvn sonar:sonar"
                       }
                  }
            }
        }
        // stage("Quality Gate") {
        //     steps {
        //         timeout(time: 1, unit: 'HOURS') {
        //             // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
        //             // true = set pipeline to UNSTABLE, false = don't
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

         stage("maven build") {
                 steps{
                    sh "mvn clean install"
                }
              }

         stage("docker image build")  {
            steps {
                // script {
                //     dockerImage = docker.build("shiva9921/mywebsite:${env.BUILD_ID}")
                // }
                sh "docker build -t tom ."
                sh "docker run -p 8080:8081 tom"
            }
         } 
        
    }
}

