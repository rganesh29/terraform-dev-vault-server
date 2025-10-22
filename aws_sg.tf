resource "aws_security_group" "demo" {
  vpc_id = aws_vpc.demo.id
  description = var.sg-description

  tags = {
    Name = var.sg-name
  }
  depends_on = [ aws_vpc.demo ]
}

resource "aws_vpc_security_group_ingress_rule" "demo1" {
  security_group_id = aws_security_group.demo.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  depends_on = [ aws_security_group.demo ]
}

resource "aws_vpc_security_group_ingress_rule" "demo2" {
  security_group_id = aws_security_group.demo.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 8200
  to_port = 8200
  ip_protocol = "tcp"
  depends_on = [ aws_security_group.demo ]
}

resource "aws_vpc_security_group_egress_rule" "demo" {
  security_group_id = aws_security_group.demo.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  depends_on = [ aws_security_group.demo ]
}