pipeline {
    agent { docker { image 'andrehz/python' } }
       stages {
           stage('Build') {
            steps {
                echo "Instalando"
                sh "pip install -r requirements.txt"
                }
                }
        stage('Teste') {
            steps {
                echo "Executando os testes de RPA"
                sh 'robot -d ./logs tests/'
                
                input(message: 'Terminou?', ok: 'Yes')
            }
            post {
                always   {
                        robot otherFiles: '**/*.png', outputPath: 'logs'
                }
            }
        }
    
   } 
}