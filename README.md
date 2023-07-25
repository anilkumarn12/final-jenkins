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

![image](https://github.com/anilkumarn12/final-jenkins/assets/134625092/ad3533ae-5231-4df5-b1f3-68a181c32973)
