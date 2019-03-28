provider "aws" {
access_key="${var.access_key}"
secret_key="${var.secret_key}"
region = "${var.region}"
}

resource "aws_instance" "storeTerraformInstance" {
ami = "ami-0636e431011fa9e7d"
instance_type = "t2.micro"
key_name = "storemanagerInstanceKey"
tags = {
    Name="StoreTerraformInstance"
  }
}
