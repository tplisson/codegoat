resource "aws_subnet" "primary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_primary
  availability_zone = "${var.region}a"
  tags = {
    yor_trace = "7b781115-79bc-46c4-a939-a8d8f7c01bcd"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_secondary
  availability_zone = "${var.region}c"
  tags = {
    yor_trace = "d9c0dcd7-0955-4761-9508-0acd4f142b46"
  }
}
