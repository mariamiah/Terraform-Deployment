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








