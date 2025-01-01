resource "aws_instance" "web" {
  ami           = data.aws_ami.amiID.id
  instance_type = "t3.micro"

  key_name               = "firstinstance-key"
  vpc_security_group_ids = [aws_security_group.firstinstance-gp.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "firstinstance"
    Project = "FIrst Terraform Project"
  }
}
