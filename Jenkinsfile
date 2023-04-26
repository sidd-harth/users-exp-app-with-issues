pipeline {
  agent any

  tools {
    maven 'M386'
  }

  stages {
  
  
  
      stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('Sonarqube') {
        sh 'mvn clean verify sonar:sonar  -Dsonar.projectKey=Mule-Sec-Ops-Sonar  -Dsonar.projectName=Mule-Sec-Ops-Sonar   -Dsonar.host.url=http://sonarqube:9000  -Dsonar.token=sqp_3c029237d556c67b14ecda6f62d912b72b43adce -Dsonar.sources=src/'
      } 
    }
    }

    stage('SonarQube Quality Gate') {
      steps {
        withSonarQubeEnv('Sonarqube') {
          timeout(time: 2, unit: 'MINUTES') {
             script {
               waitForQualityGate abortPipeline: true
             }
         }
       }
      } 
    }

    stage('Push Artefact to Exchange') {
      steps {
        sh 'mvn clean deploy'
      }
    }
	
	
	stage('Deploy to CH2') {
      steps {
        sh 'mvn clean deploy -DmuleDeploy'
      }
    }

  }
}