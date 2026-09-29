# Terraform Day 2 & 3

## Overview

This folder contains my Terraform Day 2 and Day 3 hands-on practice as part of my AWS Infrastructure as Code (IaC) learning journey.

During Day 2 and Day 3, I moved beyond the basic Terraform concepts and used Terraform to build AWS infrastructure involving networking, security, compute resources, variables, and environment-specific configuration.

## What I Built in AWS Using Terraform

Using Terraform, I created a custom AWS infrastructure consisting of:

* Custom VPC
* Two subnets
* Internet Gateway
* Public Route Table
* Route Table Associations
* Security Group
* EC2 Instance
* Terraform Variables
* Development and Stage environment configuration

## Architecture

```text
                         Internet
                            |
                            |
                   Internet Gateway
                            |
                            |
                    Custom VPC
                    10.0.0.0/16
                       /      \
                      /        \
                     /          \
            Subnet 1              Subnet 2
          10.0.1.0/24           10.0.2.0/24
          us-east-1a             us-east-1b
                \                  /
                 \                /
                  \              /
                   Public Route Table
                          |
                          |
                     EC2 Instance
```

## AWS Resources

### 1. Custom VPC

Created a custom VPC with the CIDR block:

```text
10.0.0.0/16
```

Resource name:

```text
ecell-vpc
```

The VPC provides the main networking environment for the infrastructure.

### 2. Subnet 1

Created the first subnet with:

```text
CIDR: 10.0.1.0/24
Availability Zone: us-east-1a
Name: subnet_1
```

### 3. Subnet 2

Created the second subnet with:

```text
CIDR: 10.0.2.0/24
Availability Zone: us-east-1b
Name: subnet_2
```

Both subnets are connected to the public route table.

### 4. Internet Gateway

Created an Internet Gateway and attached it to the custom VPC.

The Internet Gateway provides a path for internet connectivity for resources using the public route.

### 5. Public Route Table

Created a public route table with the route:

```text
0.0.0.0/0 → Internet Gateway
```

The route table is associated with both subnets.

### 6. Security Group

Created a security group for the EC2 instance.

The configured inbound rules are:

| Protocol | Port | Source    | Purpose |
| -------- | ---: | --------- | ------- |
| TCP      |   22 | 0.0.0.0/0 | SSH     |
| TCP      |   80 | 0.0.0.0/0 | HTTP    |
| TCP      |  443 | 0.0.0.0/0 | HTTPS   |

> **Note:** These rules were used for learning and testing purposes. In production environments, access should generally be restricted to trusted sources where possible.

### 7. EC2 Instance

Created an EC2 instance inside the custom VPC.

The configuration includes:

* Ubuntu AMI
* `t3.micro` as the default instance type
* Public IP address
* Custom subnet
* Security group
* EC2 key pair
* Terraform variables

The EC2 instance is deployed into:

```text
Subnet 1
10.0.1.0/24
us-east-1a
```

## Variables

Terraform variables were used to make the infrastructure configuration reusable.

The project defines variables for:

* Ubuntu AMI
* Instance type
* Instance name

### Default Instance Configuration

```text
Instance Type: t3.micro
Instance Name: stage_server
```

## Environment Configuration

I also practiced using `.tfvars` files to provide different values for different environments.

### Stage Environment

`stage.tfvars`

```hcl
instance_type = "t3.micro"
name          = "stage_server"
```

### Development Environment

`dev.tfvars`

```hcl
instance_type = "t3.small"
name          = "dev_server"
```

This allows the same Terraform configuration to be used with different environment-specific values.

## Project Files

| File                  | Description                                                             |
| --------------------- | ----------------------------------------------------------------------- |
| `main.tf`             | Main Terraform configuration                                            |
| `provider.tf`         | AWS provider configuration                                              |
| `networking.tf`       | VPC, subnets, Internet Gateway, route table, and associations           |
| `security.tf`         | Security group and inbound rules                                        |
| `ec2.tf`              | EC2 instance configuration and public IP output                         |
| `variable.tf`         | Terraform variable definitions                                          |
| `dev.tfvars`          | Development environment values                                          |
| `stage.tfvars`        | Stage environment values                                                |
| `.terraform.lock.hcl` | Locks Terraform provider versions                                       |
| `.gitignore`          | Prevents Terraform-generated and unnecessary files from being committed |

## Terraform Commands Practiced

### Initialize Terraform

```bash
terraform init
```

### Validate the Configuration

```bash
terraform validate
```

### Format Terraform Files

```bash
terraform fmt
```

### Create an Execution Plan

```bash
terraform plan
```

### Plan Using Stage Variables

```bash
terraform plan -var-file="stage.tfvars"
```

### Plan Using Development Variables

```bash
terraform plan -var-file="dev.tfvars"
```

### Apply the Infrastructure

```bash
terraform apply
```

### Apply Using Stage Variables

```bash
terraform apply -var-file="stage.tfvars"
```

### Apply Using Development Variables

```bash
terraform apply -var-file="dev.tfvars"
```

### Destroy the Infrastructure

```bash
terraform destroy
```

## Terraform Concepts Practiced

During Day 2 and Day 3, I practiced:

* AWS provider configuration
* Terraform resources
* Terraform variables
* `.tfvars` files
* VPC networking
* Subnet configuration
* Availability Zones
* Internet Gateway
* Route tables
* Route table associations
* Security groups
* EC2 deployment
* Terraform outputs
* Environment-specific configuration

## Learning Outcome

Through this project, I gained practical experience in using Terraform to create AWS infrastructure through code.

I learned how different AWS networking components work together:

```text
VPC
 ↓
Subnets
 ↓
Route Table
 ↓
Internet Gateway
 ↓
Internet Connectivity
```

I also learned how a security group controls inbound traffic to an EC2 instance and how Terraform variables and `.tfvars` files can be used to manage different environment configurations.

This project helped me move from basic Terraform concepts to building a more complete AWS infrastructure using Infrastructure as Code.

## AWS Infrastructure as Code Learning Journey

Day 2 and Day 3 focused on building practical AWS infrastructure using Terraform.

I used Terraform to create networking, security, and compute resources and practiced managing the infrastructure through configuration files instead of manually creating each resource in the AWS Management Console.

## Future Learning

I will continue adding new Terraform and AWS infrastructure projects to this repository as I progress through my learning journey.

---

**AWS Infrastructure as Code — Learning by Building.**
