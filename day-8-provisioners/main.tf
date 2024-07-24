resource "aws_key_pair" "test" {
  key_name = "test"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "ec2provisioner" {
    ami = var.ami
    instance_type = var.instance
    key_name = aws_key_pair.test.key_name
    tags = {
      Name = "ec2provisioner"
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }
    provisioner "local-exec" {
      command = "touch provisioner"
    }
    provisioner "remote-exec" {
      inline = [ "touch remote",
      "echo remote provisioner in AWS EC2 >> remote",]
    }
    provisioner "file" {
      source = "test"
      destination = "/home/ec2-user/test"
      
    }
}