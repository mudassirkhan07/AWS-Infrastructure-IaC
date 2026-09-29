# Terraform Day 1

## Overview

This folder contains my Terraform Day 1 practice as part of my AWS Infrastructure as Code (IaC) learning journey.

For Day 1, I used Terraform to define basic AWS networking infrastructure in the `us-east-1` region.

## What I Built in AWS Using Terraform

Using Terraform, I created the following AWS resources:

### 1. AWS Provider

Configured the HashiCorp AWS provider with version constraint:

```hcl
version = "~> 6.0"
```

The AWS region used in the project is:

```text
us-east-1
```

### 2. Custom VPC

Created a custom Amazon VPC with the CIDR block:

```text
10.0.0.0/16
```

The VPC is named:

```text
ecell-vpc
```

### 3. Subnet

Created a subnet inside the custom VPC with:

```text
CIDR: 10.0.1.0/24
Name: subnet_1
```

## Architecture

```text
                    AWS
                     |
                 us-east-1
                     |
                Custom VPC
                10.0.0.0/16
                     |
                  Subnet
                10.0.1.0/24
```

## Terraform Configuration

The Day 1 Terraform configuration defines:

- AWS provider
- AWS region
- Custom VPC
- VPC CIDR block
- Subnet
- Subnet CIDR block
- Resource tags

## Terraform Workflow

The basic workflow I practiced with Terraform was:

```text
Write Terraform Configuration
        ↓
terraform init
        ↓
terraform plan
        ↓
terraform apply
        ↓
AWS Infrastructure
        ↓
terraform destroy
```

## Common Terraform Commands

### Initialize Terraform

```bash
terraform init
```

### Validate the configuration

```bash
terraform validate
```

### Format Terraform files

```bash
terraform fmt
```

### Create an execution plan

```bash
terraform plan
```

### Create the AWS infrastructure

```bash
terraform apply
```

### Destroy the infrastructure

```bash
terraform destroy
```

## Files

| File | Description |
|------|-------------|
| `main.tf` | Contains the Terraform configuration for the AWS provider, VPC, and subnet |
| `.gitignore` | Prevents unnecessary and Terraform-generated files from being committed |

## What I Learned

Through this Day 1 project, I learned how Terraform can be used to define AWS infrastructure through code.

I practiced:

- Configuring the AWS provider
- Selecting an AWS region
- Creating a custom VPC
- Creating a subnet inside a VPC
- Defining CIDR blocks
- Using Terraform resources
- Using resource tags
- Following the Terraform initialization, planning, and deployment workflow

This gave me a practical foundation for managing AWS infrastructure using Infrastructure as Code.

## AWS Infrastructure as Code Learning Journey

This project is the first step in my hands-on journey of learning AWS Cloud and Infrastructure as Code using Terraform.

### Day 1

During Day 1, I created basic AWS networking infrastructure using Terraform, including a custom VPC and a subnet.

I also practiced the core Terraform workflow of initializing, validating, planning, applying, and destroying infrastructure.

### Future Learning

I will continue adding new Terraform and AWS infrastructure projects to this repository as I progress through my learning journey.

---

**AWS Infrastructure as Code — Learning by Building.**
