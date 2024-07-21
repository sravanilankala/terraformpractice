# provider alias for mumbai region
provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}
# provider alias for sydney region
provider "aws" {
    region = "ap-southeast-2"
    alias = "sydney" 
}
# S3 bucket creation in mumbai
resource "aws_s3_bucket" "s3mumbai" {
    bucket = "s3mumbai428" 
    provider = aws.mumbai
}
resource "aws_s3_bucket" "s3sydny" {
    bucket = "s3sydney428" 
    provider = aws.sydney
}