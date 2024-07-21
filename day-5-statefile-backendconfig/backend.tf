terraform {
  backend "s3" {
    bucket = "sravu28"
    key = "day-5/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "tf-statelock-dynamodb"
    encrypt = true # ensures the state file is encrypted at rest in S3
  }
}