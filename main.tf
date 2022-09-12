terraform {
  backend "remote" {
    organization = "mdixapc"
    workspaces {
      name = "terraform-sample"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "jenkins_server" {
  ami = "ami-051f0947e420652a9"
  instance_type = "t3.micro"
  vpc_security_group_ids  = ["sg-0541d523b2625fa85"]
  subnet_id = "subnet-07225cb9aa01bbb0f"

  tags = {
    Name = format("%s_jenkins_server",var.environment)
  }
}
