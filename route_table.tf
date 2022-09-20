#create public route table (assosiated with internet gateway)
resource "aws_route_table" "lamp_stack_public_subnet_route_table" {
    vpc_id = "${aws_vpc.lamp_stack.id}"
    route {
    cidr_block = "${var.route_table_cidr}"
    gateway_id = "${aws_internet_gateway.lamp_stack_internet_gateway.id}"
    }

}

#create private subnet route table
resource "aws_route_table" "lamp_stack_private_subnet_route_table" {
    vpc_id = "${aws_vpc.lamp_stack.id}"

}

#create default route table
resource "aws_default_route_table" "lamp_stack_main_route_table" {
    default_route_table_id = "${aws_vpc.lamp_stack.default_route_table_id}"

}

#assosiate public subnet with public route table
resource "aws_route_table_association" "lamp_stack_route_table_association" {
subnet_id = "${aws_subnet.lamp_stack_public_subnet.id}"
route_table_id = "${aws_route_table.lamp_stack_public_subnet_route_table.id}"
}

#assosiate private subnets with private route table
resource "aws_route_table_association" "lamp_stack__private_subnet_one_route_table_assosiation" {
subnet_id = "${aws_subnet.lamp_stack_private_subnet_one.id}"
route_table_id = "${aws_route_table.lamp_stack_private_subnet_route_table.id}"
}
resource "aws_route_table_association" "lamp_stack_private_subnet_two_route_table_assosiation" {
subnet_id = "${aws_subnet.lamp_stack_private_subnet_two.id}"
route_table_id = "${aws_route_table.lamp_stack_private_subnet_route_table.id}"
}