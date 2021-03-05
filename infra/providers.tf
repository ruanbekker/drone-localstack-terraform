terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
    random = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    profile = "localstack"
    shared_credentials_file = "/drone/src/.aws/credentials"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    s3_force_path_style = true
    endpoints {
        s3  = "http://localstack:4568"
        ec2 = "http://localstack:4568"
        ssm = "http://localstack:4568"
    }
}

provider "random" {}
