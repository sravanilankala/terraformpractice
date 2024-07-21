terraform {
  backend "s3" {
    bucket = "sravu28"
    key    = "day-3/terraform.tfstate"
    region = "us-west-2"
  }
}
