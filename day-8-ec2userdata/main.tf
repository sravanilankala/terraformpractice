resource "aws_instance" "ec2userdata" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.keypair
    tags = {
      Name = "ec2userdata"
    }
    user_data = file("httpd.sh")
}