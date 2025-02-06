data "aws_caller_identity" "current" {}

locals {
  name_prefix = split("/", data.aws_caller_identity.current.arn)[1]
  account_id  = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "s3_tf" {
  #checkov:skip=CKV2_AWS_62:no need for event notifications enabled
  #checkov:skip=CKV_AWS_21:no need for data stored in the S3 bucket have versioning enabled
  #checkov:skip=CKV2_AWS_6:no need for S3 bucket has a Public Access block
  #checkov:skip=CKV_AWS_18:no need for S3 bucket has access logging enabled
  #checkov:skip=CKV_AWS_144:no need for S3 bucket has cross-region replication enabled
  #checkov:skip=CKV_AWS_145:no need for S3 buckets are encrypted with KMS by default
  #checkov:skip=CKV2_AWS_61:no need for an S3 bucket has a lifecycle configuration
  bucket = "${local.name_prefix}-s3-tf-bkt-${local.account_id}"
}
