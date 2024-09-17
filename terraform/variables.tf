variable "region" {
        default = "eu-central-1"
        type = string
        description = "AZ"
}
variable "profile" {
        default = "mariofilho"
        type = string
        description = "local aws cli profile"
}
variable "vpc_id" {
        default = "vpc-0e4e3248b0a00b87b"
        type = string
        description = "VPC ID"
}
variable "ami" {
        default = "ami-0e04bcbe83a83792e"
        type = string
        description = "Ubunutu 24.0 LTZ Image"
}
variable "instance_type" {
        default = "t2.micro"
        type = string
        description = "EC2 Instance type"
}
variable "key_name" {
        default = "terraform-bh"
        type = string
        description = "Key par to access the aws account/ec2 instance"
}