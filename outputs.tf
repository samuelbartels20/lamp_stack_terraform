output "lamp_stack_database_server_address" {
value = "${aws_db_instance.lamp_stack_database_instance.address}"
}
output "lamp_stack_app_server_address" {
value = "${aws_instance.lamp_stack_app_server.public_dns}"
}
