resource "aws_route_table" "rtb-terra" {
  vpc_id = "${aws_vpc.vpc-terra.id}"
    

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw-terra.id}"
  }


tags = {
    Name = "rtb-terra"
  }
}

resource "aws_route_table_association" "pub1" {
  subnet_id      = "${aws_subnet.pub1.id}"
  route_table_id = "${aws_route_table.rtb-terra.id}"
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = "${aws_subnet.pub2.id}"
  route_table_id = "${aws_route_table.rtb-terra.id}"
}







resource "aws_eip" "default" {
tags = {
    Name = "terra-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.default.id}"
  subnet_id     = "${aws_subnet.pri1.id}"
  tags = {
    Name = "terra-nat"
  }
}



resource "aws_route_table" "nat-terra" {
  vpc_id = "${aws_vpc.vpc-terra.id}"
    tags = {
    Name = "nat-terra"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat.id}"
  }
}

resource "aws_route_table_association" "pri1" {
  subnet_id      = "${aws_subnet.pri1.id}"
  route_table_id = "${aws_route_table.nat-terra.id}"
}

resource "aws_route_table_association" "pri2" {
  subnet_id      = "${aws_subnet.pri2.id}"
  route_table_id = "${aws_route_table.nat-terra.id}"
}
