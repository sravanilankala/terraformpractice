data "aws_subnet" "datasrcsub" {
    filter {
      name = "availability-zone"
      values = [ "us-west-2c" ]
    }
}
data "aws_ami" "amzlinx" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "name"
      values = [ "al2023-ami-2023.5.20240701.0-kernel-6.1-x86_64" ]
    }
    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
    filter {
      name = "architecture"
      values = [ "x86_64" ]
    }
  
}
resource "aws_instance" "datasource" {
    ami = data.aws_ami.amzlinx.id
    instance_type = "t2.micro"
    key_name = "Oregonkey"
    #subnet_id = "subnet-0f13bbb54507fbd29"
    subnet_id = data.aws_subnet.datasrcsub.id
}