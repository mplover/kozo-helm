#!groovy

pipeline {
  environment {
    registry = "https://docker.mplover.com"
    image = "mplover/kozo-helm:${env.BUILD_ID}"
    registryCredential = "docker-registry-jenkins"
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        script {
          docker.withRegistry(registry, registryCredential) {
            image = docker.build(image, '--no-cache .')
            image.push()
          }
        }
      }
    }
    stage('Tagging latest') {
      when {
        branch 'main'
      }
      steps{
        script {
          docker.withRegistry(registry, registryCredential) {
            image.push('latest');
          }
        }
      }
    }
  }
}
