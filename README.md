# HanEKSAlertLogging
Repo to log EKS cluster alert status into dynamo db

![image](https://user-images.githubusercontent.com/83316247/179721686-3a884750-55b5-4ba0-be4b-15df1499a7b2.png)


1. In AWS Managed Prometheus (AMP) used to monitor the health of EKS cluster and APP. If there are any alert event occurs , then message will be pushed to SNS.
2. An SNS topic is configured to which the Alert Event from AMP is sent and invoke the lambda function with the payload passes by AMP alert.
3. From the SNS topic, the lambda function is invoked and the SNS message is passed in as input.
4. The lambda function processes the input, extracts out key alert information, and pushes this extracted information into DynamoDB.

**Installation Guide:** :

Terraform code in this repo will create the following resources in the region selected by the user.

      1.IAM policy
      2.IAM role
      3.Lambda function
      4.SNS Topic and subscription
      5.Dynamo db table

**Pre-Requisites for the User:**


1. IAM user should have the below required permission to create/destroy/update the resources

      IAM policy
      IAM role
      Lambda function
      SNS Topic and subscription
      Dynamo db table

2. S3 bucket and Dynamo db table should be pre configured to store the remote state into s3 and lock configuration into dynamo db table.
   Update the new bucket name in ./backend_config/dev.conf file 
   Update the dynamodb table value in backend.tf file
   
**Running Instruction:**

terraform init -backend-config ./backend_config/dev.conf
terraform workspace new dev
terraform workspace select dev
terraform plan -var-file dev.tfvars -auto-approve

**Instruction to manage multiple environments:**

Cosidering as an example to create resource for QA environment
1. Create new configuration ./backend_config/dev.conf 
      You can use the same bucket or new bucket to maintain the terraform state.
2. Create new Variable file QA.tfvars and Set the required variables values as per the QA environment requirement.
      
2.Running Instruction:

terraform init -backend-config ./backend_config/QA.conf
terraform workspace new QA
terraform workspace select QA
terraform plan -var-file QA.tfvars -auto-approve

