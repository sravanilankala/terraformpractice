resource "aws_instance" "nullresource" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.keypair
    tags = {
      Name = "ec2"
    }
}
resource "null_resource" "testnullresrc" {
    triggers = {
      id = timestamp()
    }
     provisioner "local-exec" {
        command = <<-EOT
            touch srav.txt
        EOT
    }
}