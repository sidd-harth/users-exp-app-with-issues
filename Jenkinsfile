pipeline {
  agent any

  tools {
    maven 'M386'
  }

  stages {

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