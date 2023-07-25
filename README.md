# final-jenkins

Automated Infrastructure (AWS) Setup Using Terraform and Jenkins 
In this blog we will discuss how to execute the Terraform code using Jenkins and set up AWS infrastructure such as EC2,VPC,SUBNET and SSECURITY GROUP.
For those of you are unfamiliar with Jenkins, it is an open-source continuous integration and continuous development automation tool that allows us to implement CI/CD workflows, called pipelines.
Project Description: In this project, we will build how multiple Terraform lifecycle infrastructures can be easily and dynamically managed with Jenkins.
Services involved: AWS, Jenkins, Terraform, S3.
Pre-requisites
1.	AWS Account created
2.	Jenkins Installed and Configured.
3.	Terraform installed
4.	S3 access available to IAM role.
Step1: Jenkins, Terraform Installed and configured
Step2: AWS Terraform code modularized, to deploy VPC, Subnets, EC2, Security groups created using Terraform and run through Jenkins
Step3: S3 used as backend to store State file 
Step4: Email triggered with summary of Deployment



Step1: Jenkins, Terraform Installed and configured
AWS account created and EC2 Launched 
 
S3 bucket created
 


Create on IAM role and give the access
 

Open on EC2 
 
Click on security and Modify IAM role 

 
Update IAM role click

 


 
	Click on connect

 
Terraform installed, java installed, Jenkins installed see the versions
How to install JDK and Jenkins and follow below reference link:
	https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

How to install terraform follow the below commands:
	snap install terraform --classic
	terraform --version  
Part-02: AWS Terraform code modularized, to deploy VPC, Subnets, EC2, Security groups created using Terraform and run through Jenkins
This is my git hub link: https: //github.com/anilkumarn12/final-jenkins/tree/main
copy on public Ip address paste on new tab 54.227.177.20:8080 connect to Jenkins already I am longlined so that’s why I am enter user name and password.

 



My Jenkins account was opened click Manage Jenkins and open on Plugins
 
I am installed terraform plugin

 
Add access key and secret key 
Click job name
 

 

Click on apply and save




This is my pipeline script:
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/anilkumarn12/final-jenkins.git']])
            }
        }
        stage("terraform init") {
            steps {
                sh 'terraform init'
            }
        }
        stage("plan") {
            steps {
                sh 'terraform plan'
            }
        }

        stage("Action") {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

 

Click on Build now and successfully completed 

 

Out put is success


Go to EC2 instance once check created on resources
 


 
Security group also created 
Step3: Successfully all created and then state file also created in S3 bucket
 
Step4: Email triggered with summary of Deployment
Go to Gmail account open and go to settings Forwarding and POPYMAP click
Next Enable IMAP select. 


Click on Security and select on 2-step-verication
  

Open on App passwords 
 




I am adding on windows computer
 


Go to Jenkins 
 
Click on Manage Jenkins and go to System open 



SMTP server -give as it is follow next go to advanced  click port -465 ,user name-your email id enter, password : before 2-step verification to inside App password showing on password copy to past in this email password enter 
 
Click on Test configuration after Email successfully test showing once check your mail id

Successfully triggered in Jenkins
 
This my Canva ppt link :  
https://www.canva.com/design/DAFph61fVvI/v4UNutGI6TnqDBq9mFGU1w/edit?utm_content=DAFph61fVvI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton
