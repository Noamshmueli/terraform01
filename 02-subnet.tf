resource "aws_subnet" "pub1" {
  cidr_block        = "${var.subnet1_address_space}"
  vpc_id            = "${aws_vpc.vpc-terra.id}"
  availability_zone = "us-east-1c"
  tags = {
    Name = "terra-pub1"
  }
}

resource "aws_subnet" "pub2" {
  cidr_block        = "${var.subnet2_address_space}"
  vpc_id            = "${aws_vpc.vpc-terra.id}"
  availability_zone = "us-east-1d"
  tags = {
    Name = "terra-pub2"
  }
}

resource "aws_subnet" "pri1" {
  cidr_block        = "${var.subnet3_address_space}"
  vpc_id            = "${aws_vpc.vpc-terra.id}"
  availability_zone = "us-east-1c"
  tags = {
    Name = "terra-pri1"
  }
}

resource "aws_subnet" "pri2" {
  cidr_block        = "${var.subnet4_address_space}"
  vpc_id            = "${aws_vpc.vpc-terra.id}"
  availability_zone = "us-east-1d"
  tags = {
    Name = "terra-pri2"
  }
}
