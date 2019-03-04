variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
  default = "private1"
}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}


variable "network_address_space" {
  default = "10.0.0.0/16"
}
variable "subnet1_address_space" {
  default = "10.0.1.0/24"
}
variable "subnet2_address_space" {
  default = "10.0.2.0/24"
}
variable "subnet3_address_space" {
  default = "10.0.3.0/24"
}
variable "subnet4_address_space" {
  default = "10.0.4.0/24"
}




resource "aws_vpc" "vpc-terra" {
  cidr_block = "${var.network_address_space}"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc-terra"
  }
}

resource "aws_internet_gateway" "igw-terra" {
  vpc_id = "${aws_vpc.vpc-terra.id}"
  tags = {
    Name = "igw-terra"
  }
}
