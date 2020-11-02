terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "clnoel-kubernetes"
    key    = "tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "kubernetes" {
  source = "./modules/kubernetes"
  vpc_cidr_block = "10.0.0.0/16"
}
