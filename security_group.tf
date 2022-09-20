#create security group for App server
resource "aws_security_group" "lamp_stack_app_server_security_group" {
    name = "lamp_stack_app_server_security_group"
    description = "Allow all inbound traffic"
    vpc_id = "${aws_vpc.lamp_stack.id}"

}
#create security group ingress rule for App server
resource "aws_security_group_rule" "lamp_stack_app_server_ingress" {
    count = "${length(var.app_server_ports)}"
    type = "ingress"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "${element(var.app_server_ports, count.index)}"
    to_port = "${element(var.app_server_ports, count.index)}"
    security_group_id = "${aws_security_group.lamp_stack_app_server_security_group.id}"
}
#create security group egress rule for App server
resource "aws_security_group_rule" "lamp_stack_app_server_egress" {
    count = "${length(var.app_server_ports)}"
    type = "egress"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "${element(var.app_server_ports, count.index)}"
    to_port = "${element(var.app_server_ports, count.index)}"
    security_group_id = "${aws_security_group.lamp_stack_app_server_security_group.id}"
}
#create security group for db
resource "aws_security_group" "lamp_stack_database_security_group" {
    name = "lamp_stack_database_security_group"
    description = "Allow all inbound traffic"
    vpc_id = "${aws_vpc.lamp_stack.id}"

}
#create security group ingress rule for App server database
resource "aws_security_group_rule" "lamp_stack_database_server_ingress" {
    count = "${length(var.database_ports)}"
    type = "ingress"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "${element(var.database_ports, count.index)}"
    to_port = "${element(var.database_ports, count.index)}"
    security_group_id = "${aws_security_group.lamp_stack_database_security_group.id}"
}
#create security group egress rule for App server database
resource "aws_security_group_rule" "lamp_stack_database_server_egress" {
    count = "${length(var.database_ports)}"
    type = "egress"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "${element(var.database_ports, count.index)}"
    to_port = "${element(var.database_ports, count.index)}"
    security_group_id = "${aws_security_group.lamp_stack_database_security_group.id}"
}
