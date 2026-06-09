resource "aws_security_group" "no_description_sg" {
  name   = "xsup-70268-repro-sg"
  vpc_id = "vpc-12345678"

  # No `description` on group or rules -> violates CKV_AWS_23 / APPSEC_AWS_23
  # AND the cloned custom rule (same fingerprint)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
