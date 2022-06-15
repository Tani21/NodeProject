pipeline {
  agent any
    
  tools {nodejs "NodeJS"}
    
  stages {
        
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Tani21/NodeProject.git'
      }
    }
        
    stage('Install dependencies') {
      steps {
        sh 'npm install next-update --save-dev'
        sh 'npm run dep:update'
        sh './update_dependency.sh'
      }
    }
     
    stage('Test') {
      steps {
         sh 'npm test'
      }
    }   
    
    stage('Deploying to server'){
        steps{
           sh ' npm install -g serve'
           sh 'npm run build'
           sh 'npm start'
        }
    }
  }
}
