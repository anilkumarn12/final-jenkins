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
![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/84dcbe97-9e0a-4a1b-968f-19a7c8f3b4df)
 
S3 bucket created
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/f112eeee-99df-4377-87ab-96e0e0b1e38d)



Create on IAM role and give the access
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/94a799da-a1a5-4fa3-9e6f-255d0660585f)


Open on EC2 
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/a50412a2-f059-41f0-8ce8-0c88f07d1806)

Click on security and Modify IAM role 

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/26e85da5-88ff-416f-be70-b6603ffb12ba)

Update IAM role click

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/78709986-676d-4400-b52b-62093a63f20c)

 


 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/5a901242-864a-411f-a2e7-d4d430069c2b)

Click on connect

 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/5a552e81-e7e6-479f-a232-e4ee30a6a27b)

Terraform installed, java installed, Jenkins installed see the versions
How to install JDK and Jenkins and follow below reference link:
	https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

How to install terraform follow the below commands:
   1. snap install terraform --classic
   2. terraform --version  

Part-02: AWS Terraform code modularized, to deploy VPC, Subnets, EC2, Security groups created using Terraform and run through Jenkins
This is my git hub link: https: //github.com/anilkumarn12/final-jenkins/tree/main
copy on public Ip address paste on new tab 54.227.177.20:8080 connect to Jenkins already I am longlined so that’s why I am enter user name and password.

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/c993186e-7fe3-4865-abbf-0fa03464c367)

 
My Jenkins account was opened click Manage Jenkins and open on Plugins
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/1a09ac6c-ce7d-4316-8ef5-9d26c58ec96d)


![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/66c0bf58-8d31-4879-b19f-0fa1827a6de0)

I am installed terraform plugin

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/e3fea421-1751-4d30-aec3-d68113d6bce5)
Add access key and secret key 

Click job name
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/a356485a-77c6-45f2-8024-3700fe489487)

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/2a4273c9-15da-43ee-a73f-479b0cae19fd)
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

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/4e5e7cb0-0f5b-433b-84af-e41880a915e4)
Click on Build now and successfully completed 

 
![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/e37e74f8-404a-49f9-9b4a-defdcb9e1bf0)
Out put is success


Go to EC2 instance once check created on resources
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/3602863a-7a4b-4e2f-9eaa-d2ea04c638b7)


 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/7d7f3075-7925-4188-89de-e7a83488b62e)

Security group also created 
Step3: Successfully all created and then state file also created in S3 bucket
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/fc691a7e-9ff4-4ad8-a047-d3895a1cbe7b)

Step4: Email triggered with summary of Deployment
Go to Gmail account open and go to settings Forwarding and POPYMAP click
Next Enable IMAP select. 
![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/a60fa5f8-d820-46b0-abbe-e78bf549c995)

Click on Security and select on 2-step-verication
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/413bd8ba-64d3-4744-b91f-b0f65cba710c)
 

Open on App passwords 
![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/1f7c1bb9-bc63-4f33-9a66-ed272c27308c)
 

I am adding on windows computer
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/7893d814-06da-4b07-9408-9522e70a935a)


Go to Jenkins 
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/ac2e60a9-e2ab-4879-bf55-52bdb78cf07b)

Click on Manage Jenkins and go to System open 



SMTP server -give as it is follow next go to advanced  click port -465 ,user name-your email id enter, password : before 2-step verification to inside App password showing on password copy to past in this email password enter 
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/419b91ba-93f1-4f3f-a36b-3c9731738e87)

Click on Test configuration after Email successfully test showing once check your mail id

Successfully triggered in Jenkins
 ![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/c92acd77-3f1d-4c17-8189-e8c1468685ab)

This my Canva ppt link :  
https://www.canva.com/design/DAFph61fVvI/v4UNutGI6TnqDBq9mFGU1w/edit?utm_content=DAFph61fVvI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton
