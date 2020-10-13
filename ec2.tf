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
  region  = "us-east-1"
}

resource "aws_instance" "derek-example" {
  ami           = "ami-0dba2cb6798deb6d8" # Ubuntu Server 20.04 LTS from us-east-1
  instance_type = "t2.micro"
  subnet_id     = "subnet-0d00e43d1dc20ff38" # Had to create this in AWS Console
}
