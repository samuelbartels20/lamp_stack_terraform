#create internet gateway
resource "aws_internet_gateway" "lamp_stack_internet_gateway" {
    vpc_id = "${aws_vpc.lamp_stack.id}"

}