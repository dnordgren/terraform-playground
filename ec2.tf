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

resource "aws_instance" "derek-example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  subnet_id     = "subnet-0d00e43d1dc20ff38" # Had to create this in AWS Console
}
