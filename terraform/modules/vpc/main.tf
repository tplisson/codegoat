resource "aws_vpc" "example" {
  cidr_block = var.cidr
  tags = {
    yor_trace = "57ef9870-ea97-4dd3-96c4-77788d561f0d"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  tags = {
    yor_trace = "7c550f5d-e878-4bbb-9e06-5af8272ec1ba"
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "50daa40c-30ab-4905-992e-68b0e6c08ee1"
  }
}

resource "aws_security_group" "allow_ssh_from_valid_cidr" {
  name        = "allow_ssh_from_valid_cidr"
  description = "Allow SSH inbound from specific range"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = tolist([var.cidr])
  }
  tags = {
    yor_trace = "66202e00-a514-4309-8469-b32ac351f7b5"
  }
}
