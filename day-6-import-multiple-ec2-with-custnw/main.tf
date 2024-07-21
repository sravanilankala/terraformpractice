resource "aws_instance" "custec2" {
    ami = "ami-078701cc0905d44e4"
    instance_type = "t2.micro"
    tags = {
        Name = "srav-2a"
    }

  
}
resource "aws_instance" "customec2" {
    ami = "ami-078701cc0905d44e4"
    instance_type = "t2.micro"
    tags = {
        Name = "srav-2b"
    }

}