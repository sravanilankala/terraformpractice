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
variable "instance_name" {
    type = string
    description = "passing instance name to main"
    default = ""
}
variable "az" {
    type = string
    description = "passing az to main"
    default = ""
}