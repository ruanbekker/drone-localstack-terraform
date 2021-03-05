provider "aws" {
    region = "us-east-1"
    profile = "localstack"
    shared_credentials_file = "/drone/src/.aws/credentials"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    s3_force_path_style = true
    endpoints {
        s3 = "http://localstack:4568"
    }
}

resource "aws_s3_bucket" "gitea_remote_state" {
  bucket        = "gitea-terraform-remote-state"
  acl           = "private"
  force_destroy = true
}

output "s3_bucket_name" {
  value = aws_s3_bucket.gitea_remote_state.id
}
