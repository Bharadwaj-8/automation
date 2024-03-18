pipeline {
  agent any

  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Validate (Optional)') {
      steps {
        script {
          def validate = input message: 'Do you want to run Terraform Validate (y/N)?', choices: ['y', 'N']
          if (validate == 'y') {
            sh 'terraform validate'
          }
        }
      }
    }
    stage('Terraform Plan (Optional)') {
      steps {
        script {
          def plan = input message: 'Do you want to run Terraform Plan (y/N)?', choices: ['y', 'N']
          if (plan == 'y') {
            sh 'terraform plan'
          }
        }
      }
    }
    stage('Terraform Apply (Optional)') {
      steps {
        script {
          def apply = input message: 'Do you want to run Terraform Apply (y/N)?', choices: ['y', 'N']
          if (apply == 'y') {
            sh 'terraform apply'
          }
        }
      }
    }
  }
}
