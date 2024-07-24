variable "aws_region" {
    type = string
    nullable = false
    default = ""
    validation {
      condition = var.aws_region == "us-west-2" || var.aws_region == "ap-south-1"
      error_message = "The variable 'aws_region' must be one of the regions: us-west-2 or ap-south-1"
    }
}
provider "aws" {
    region = "us-east-1" 
}
resource "aws_s3_bucket" "name" {
    bucket = "fdhgykjuhk"
}