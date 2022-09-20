#create private subnet one
resource "aws_subnet" "lamp_stack_private_subnet_one" {
    vpc_id = "${aws_vpc.lamp_stack.id}"
    cidr_block = var.subnet_cidr[0]
    availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"

}

#create private subnet two
resource "aws_subnet" "lamp_stack_private_subnet_two" {
vpc_id = "${aws_vpc.lamp_stack.id}"
cidr_block = var.subnet_cidr[1]
availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"

}

#create public subnet
resource "aws_subnet" "lamp_stack_public_subnet" {
vpc_id = "${aws_vpc.lamp_stack.id}"
cidr_block = var.subnet_cidr[2]
availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"
map_public_ip_on_launch = true

}


#create aws rds subnet groups
resource "aws_db_subnet_group" "lamp_stack_database_subnet_group" {
    name = "lamp_stack_database_subnet_group"
    subnet_ids = ["${aws_subnet.lamp_stack_private_subnet_one.id}", "${aws_subnet.lamp_stack_private_subnet_two.id}"]

}
