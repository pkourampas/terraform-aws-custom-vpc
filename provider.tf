terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Specify the Provider
provider "aws" {
    region = local.selected_region
}
