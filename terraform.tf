terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.85.0"
    }
  }
  backend "s3" {
    bucket = "sctp-ce8-tfstate"
    key    = "slim-s3-tf-ci.tfstate"
    region = "ap-southeast-1"
  }
}
