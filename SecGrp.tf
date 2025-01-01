resource "aws_security_group" "firstinstance-gp" {
  name        = "firstinstance-gp"
  description = "Description for firstinstance-gp"

  tags = {
    Name = "firstinstance-gp"
  }
}

resource "aws_vpc_security_group_ingress_rule" "firstinstance-gp_ipv4" {
  security_group_id = aws_security_group.firstinstance-gp.id
  cidr_ipv4         = "174.89.198.165/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "firstinstance-gp_ipv6" {
  security_group_id = aws_security_group.firstinstance-gp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "firstinstance-gp_traffic_ipv4" {
  security_group_id = aws_security_group.firstinstance-gp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "firstinstance-gp_traffic_ipv6" {
  security_group_id = aws_security_group.firstinstance-gp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
