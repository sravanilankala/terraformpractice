resource "aws_instance" "lifecycle" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.keypair
    availability_zone = var.az
    tags = {
        Name = "test2c"
    }
lifecycle {
    create_before_destroy = true
}
#lifecycle {
#    prevent_destroy = true
#}
#lifecycle {
#    ignore_changes = [ tags, ]
#}
}