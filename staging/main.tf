# ------------ configure remote state  ------------------------------
terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "dev-11nines-topcon-terraform-states"
    key    = "dev-terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "test_db_locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

module "wordpress" {
  source = "git::https://gitlab.com/11nines/tf-wordpress-module.git?ref=v1.1.0"

    your_name             = var.your_name
    ssh_location          = var.ssh_location
    root_password         = var.root_password
    user                  = var.user
    password              = var.password
    dbname                = var.dbname
    key                   = var.key
    region                = var.region
    public_subnet_count   = var.public_subnet_count
    private_subnet_count  = var.private_subnet_count
    intra_subnet_count    = var.intra_subnet_count
    nickname              = var.nickname
    domain_name           = var.domain_name
    environment           = var.environment
}

