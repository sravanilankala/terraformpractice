resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance
    key_name = var.keypair
    tags = {
      Name = "oregon-EC2"
    }
  
}