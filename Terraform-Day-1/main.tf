terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "esell-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "ecell-vpc"
    }
}

resource "aws_subnet" "my_subnet_1" {
    vpc_id = aws_vpc.esell-vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "subnet_1"
    }
}