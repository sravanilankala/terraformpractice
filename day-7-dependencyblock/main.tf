resource "aws_instance" "dependency" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.keypair
    tags = {
      Name = "testdep"
    }
}
resource "aws_s3_bucket" "s3dependent" {
    bucket = "dependencysrav"
    depends_on = [ aws_instance.dependency ]
}