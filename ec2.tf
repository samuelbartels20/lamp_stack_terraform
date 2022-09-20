#create App server
resource "aws_instance" "lamp_stack_app_server" {
  ami = var.ami
  instance_type = "t2.micro"
  # instance_key = "devops.pem" 
  vpc_security_group_ids = ["${aws_security_group.lamp_stack_app_server_security_group.id}"]
  subnet_id = "${aws_subnet.lamp_stack_public_subnet.id}"
  tags = {
    Name = "lamp_stack_app_server"
  }
  volume_tags = {
    Name = "lamp_stack_app_server_volume"
}
provisioner "remote-exec" { 
  inline = [
  "sudo mkdir -p /var/www/html/",
  "sudo yum update -y",
  "sudo yum install -y httpd",
  "sudo service httpd start",
  "sudo usermod -a -G apache ec2-user",
  "sudo chown -R ec2-user:apache /var/www",
  "sudo yum install -y mysql php php-mysql"
  ]
}
  provisioner "file" { 
  source = "index.php"
  destination = "/var/www/html/index.php"
  }
  connection {
  host = self.public_ip
  type = "ssh"
  user = "ubuntu"
  password = ""
  agent = false
  timeout = "1m"
  private_key = "${file("/home/samuel/Downloads/devops.pem")}"
  }
}

#create aws mysql rds instance
resource "aws_db_instance" "lamp_stack_database_instance" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  port = 3306
  vpc_security_group_ids = ["${aws_security_group.lamp_stack_database_security_group.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.lamp_stack_database_subnet_group.name}"
  name = "db_name"
  identifier = "mysqldb"
  username = "myuser"
  password = "mypassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  tags = {
    Name = "lamp_stack_database_instance"
  }
}