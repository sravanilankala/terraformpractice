resource "aws_instance" "import" {
    ami = "ami-078701cc0905d44e4"
    instance_type = "t2.micro"
    tags = {
      Name = "srav-2a"
    }
  
}
