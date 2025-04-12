terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  backend "s3" {
    bucket = "tbsantos-remote-state"
    key    = "pipeline-github/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "tiagobs"
      managed-by = "terraform"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "terraform_remote_state" "awsvpc" {
  backend = "s3"
  config = {
    bucket = "tbsantos-remote-state"
    key    = "awsvpc/terraform.tfstate"
    region = "us-east-1"
  }
}