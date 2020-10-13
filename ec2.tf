terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = map # see terraform.tfvars
}

resource "aws_instance" "derek-example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  subnet_id     = "subnet-0d00e43d1dc20ff38" # Had to create this in AWS Console
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.derek-example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}
