resource "aws_instance" "targetres" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.keypair
    tags = {
      Name = "target-resource"
    }
}
resource "aws_s3_bucket" "s3dependent" {
    bucket = "target-res-srav"
}

# terraform apply -target=aws_instance.targetres
# terraform destroy -target=aws_instance.targetres