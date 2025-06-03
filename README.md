# Terraform-and-Cloud

                                                                                                                                                      Terraform Deployment Documentation     
        
Project:   Deploy simpletimeservice on AWS with ECS, ALB, and NAT Gateway

# Overview:
This Terraform setup creates the infrastructure required to host a Docker container (simpletimeservice) using AWS ECS Fargate. It includes:

VPC with 2 public and 2 private subnets
NAT Gateway for outbound internet in private subnets
ECS Cluster and Fargate task/service
Load Balancer for external access
All compute runs in private subnets

# Directory Structure

terraform/
├── main.tf
├── variables.tf
├── outputs.tf


# Components
1. VPC & Networking
      CIDR: 10.0.0.0/16
       2 Public Subnets for Load Balancer & NAT Gateway
       2 Private Subnets for ECS tasks
       NAT Gateway attached to public subnet for internet access from private subnets
       Internet Gateway for outbound access via public subnets
2. ECS Cluster
     Cluster: simpletimeservice-cluster
     Task: Fargate task with simpletimeservice Docker image
     CPU: 256
     Memory: 512
    Container Port: 3000
3. IAM Roles
     Task execution role with AmazonECSTaskExecutionRolePolicy
4. Security Groups
     ALB: Open on port 80 to the world  
     ECS: Allows inbound traffic from ALB on port 3000
5. Load Balancer
     Application Load Balancer (ALB)
     Listens on HTTP (port 80)
      Forwards to ECS tasks on port 3000 via a target group

# Variables
Name
Default
Description
region : us-neutral-1
AWS Region

app_name : simpletimeservice
Name of the application

container_image : kapilghule/simpletimeservice:latest
Docker image to deploy
 
Defined in: variables.tf

# Deployment Steps
1. Install Prerequisites
Terraform
AWS CLI (aws configure to authenticate)

2. Initialize Terraform

bash
terraform init

3. Review the Plan

bash
terraform plan

4. Apply the Configuration

bash
terraform apply

Confirm when prompted.

5. Get the Load Balancer URL

bash
terraform output load_balancer_dns

Visit the URL in your browser to see the simpletimeservice output.

# Cleanup
To delete all resources:

bash
terraform destroy

# Notes :
Tasks are not publicly accessible directly — only through the Load Balancer.
NAT Gateway allows tasks to pull images from Docker Hub or communicate with the internet.
The application listens on port 3000, make sure your container exposes this port.

