vpc_cidr = "10.0.0.0/16"

subnet_cidr = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]

region          = "us-east-1"
ami             = "ami-0729e439b6769d6ab"
instance_key    = "devops.pem"
instance_class = "t2.micro"
database_ports = ["22", "3306"]
app_server_ports = ["22","80", "443", "3306"]
route_table_cidr = "0.0.0.0/0"

