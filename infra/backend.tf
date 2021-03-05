terraform {
  backend "s3" {
    endpoint = "http://localstack:4568"
    bucket= "gitea-terraform-remote-state"
    key = "gitea/example/test/terraform.tfstate"
    region = "us-east-1"
    profile = "localstack"
    shared_credentials_file = "/drone/src/.aws/credentials"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style = true
  }
}
