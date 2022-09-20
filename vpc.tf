#create VPC
resource "aws_vpc" "lamp_stack" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support = true
}
