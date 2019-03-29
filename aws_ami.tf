provider "aws" {
access_key = "${var.aws_access_key}"
secret_key = "${var.aws_secret_key}"
region     = "${var.aws_region}"
}
data "aws_ami" "ubuntu" {
most_recent = true

filter {
name   = "name"
values = ["Store-AMI*"] 
}

filter {
name   = "virtualization-type"
values = ["hvm"]
}

owners = ["136496309071"] # Canonical
}

resource "aws_instance" "storeTerraform" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_specific.name}"]

  tags = {
    Name = "storeTerraform"
  }
}
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "store-vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "eu-west-2a"

  tags {
    Name = "Web Public Subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "eu-west-2b"

  tags {
    Name = "Database Private Subnet"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}
