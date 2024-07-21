output "ec2_public_ip" {
    description = "IP address of public EC2 instance"
    value = aws_instance.pubec2.public_ip
}
output "ec2_private_ip" {
    description = "IP adress of private EC2 instance"
    value = aws_instance.privec2.private_ip
}