variable "ami" {
    type = string
    default = ""
    description = "passing AMI to main"
}
variable "instance" {
    type = string
    description = "passing image type to main"
    default = ""
}
variable "keypair" {
    type = string
    description = "passing keypair to main"
    default = ""
}