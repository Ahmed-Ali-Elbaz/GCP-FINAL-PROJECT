pipeline {

    agent any

    environment {

        registry = "ahmedhedihed/helloworld"
        registryCredential = "dockerhub"
    }

    stages{

        stage('Build App Image') {
          steps {
            script {
              dockerImage = docker.build registry + ":V$BUILD_NUMBER"
            }
          }
        }


        stage('Upload Image'){
          steps{
            script {
              docker.withRegistry('', registryCredential) {
                dockerImage.push("V$BUILD_NUMBER")

              }
            }
          }
        }



        // CD Stage
        stage('Deploy App on GKE cluster') {
            steps {

                withCredentials([file(credentialsId: 'cluster', variable: 'kubecfg')]){

                    sh """
                            export BUILD_NUMBER=\$(cat ../build-num.txt)
                            mv Deployment/deploy.yaml Deployment/deploy.yaml.tmp
                            cat Deployment/deploy.yaml.tmp | envsubst > Deployment/deploy.yaml
                            rm -f Deployment/deploy.yaml.tmp
                            kubectl apply --kubeconfig=${kubecfg} -f Deployment

                      """
  
                }

                 
            }     

            
        }   


    }


}






