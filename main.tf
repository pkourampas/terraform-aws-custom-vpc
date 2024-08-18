# ----- Provider -----
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ----- AWS Region -----
provider "aws" {
    region = local.selected_region
}
