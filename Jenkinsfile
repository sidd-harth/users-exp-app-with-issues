pipeline {
  agent any

  tools {
    maven 'M386'
  }

  stages {
  
  
  
      stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarQube') {
        sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=MuleSecOps -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_1c5ac3c8bef860f28b73b394a7aab499e0d10b78 -Dsonar.sources=src/'
      } 
    }
    }

    stage('SonarQube Quality Gate') {
      steps {
        withSonarQubeEnv('SonarQube') {
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