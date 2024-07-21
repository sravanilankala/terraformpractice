resource "aws_instance" "locking" {
    ami = var.ami_id
    instance_type = var.instance
    key_name = var.keypair
    #availability_zone = "us-west-2b"
    tags = {
      Name = "windows"
    }
}