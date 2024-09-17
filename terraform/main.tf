terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}
#Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = var.profile
}

#Create Jenkins EC2 Instance - Ubuntu ima
resource "aws_instance" "jenkins_bh_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = "${file("install_jenkins.sh")}" #Jenkins shell script
  tags = {
    Name = "bh-tech-ec2-jenkins"
  }
}

#Create Docker EC2 Instance - Ubuntu ami
resource "aws_instance" "docker_bh_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  user_data              = "${file("install_docker.sh")}" #Docker shell script
  tags = {
    Name = "bh-tech-ec2-docker"
  }
}
#For Jenkins Allow traffic on port 8080
#Create security group 
resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Allow inbound ports 22, 443, and 8080"
  vpc_id      = var.vpc_id

  #Allow incoming TCP requests on port 22 from my IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["84.198.67.250/32"]
  }
#Allow incoming TCP requests on port 443 from my IP
  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["84.198.67.250/32"]
  }

  #Allow incoming TCP requests on port 8080 from my IP
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["84.198.67.250/32"]
  }
  #Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}