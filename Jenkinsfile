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
        sh ''' DIR=".node_modules"
if [ -d ".node_modules" ]; then
  echo "Folder already exists"
else
  npm install
  echo "folder does not exist already"
fi'''
        
       
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
