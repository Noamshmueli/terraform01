resource "aws_instance" "terra-ubuntu-pub1" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pub1.id}"
  vpc_security_group_ids = ["${aws_security_group.sgterra.id}"]
  key_name        = "${var.key_name}"
  associate_public_ip_address = true
  tags = {
    Name = "terra-ubuntu-pub1"
  }
  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo yum install ubuntu -y",
      "sudo service ubuntu start"
    ]
  }
}




resource "aws_instance" "terra-ubuntu-pub2" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pub2.id}"
  vpc_security_group_ids = ["${aws_security_group.sgterra.id}"]
  key_name        = "${var.key_name}"
  associate_public_ip_address = true
  tags = {
    Name = "terra-ubuntu-pub2"
  }

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo yum install ubuntu -y",
      "sudo service ubuntu start"
    ]
  }
}





resource "aws_instance" "terra-ubuntu-pri1" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pri1.id}"
  vpc_security_group_ids = ["${aws_security_group.sgterra.id}"]
  key_name        = "${var.key_name}"
  tags = {
    Name = "terra-ubuntu-pri1"
  }

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo yum install ubuntu -y",
      "sudo service ubuntu start"
    ]
  }
}






resource "aws_instance" "terra-ubuntu-pri2" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pri2.id}"
  vpc_security_group_ids = ["${aws_security_group.sgterra.id}"]
  key_name        = "${var.key_name}"
  tags = {
    Name = "terra-ubuntu-pri2"
  }

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo yum install ubuntu -y",
      "sudo service ubuntu start"
    ]
  }
}