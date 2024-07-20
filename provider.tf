terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
  # backend "s3" {
  #   bucket = "demo-buc-12345"
  #   key    = "backend.tf"
  #   region = "us-east-1"
}
# }

provider "aws" {
  # Configuration options
}
