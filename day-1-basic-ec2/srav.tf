variable "ami_id" {
    type = string
    default = ""
    description = "Oregon ami id"
}
variable "instance" {
    type = string
    default = ""
    description = "EC2 instance type"
}
variable "keypair" {
    type = string
    default = ""
    description = "keypair value"
}