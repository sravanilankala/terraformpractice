resource "aws_s3_bucket" "s3" {
    bucket = "s3buckstatefile"
}
resource "aws_dynamodb_table" "tf-statelock" {
    name = "tf-statelock-dynamodb"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    
    attribute {
      name = "LockID"
      type = "S"
    }
}
