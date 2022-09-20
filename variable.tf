variable vpc_cidr {}
variable subnet_cidr{}
variable "region" {}

variable "access_key" {
  type      = string
  default   = ""
  sensitive = true
}
variable "secret_key" {
  type      = string     
  default   = ""
  sensitive = true
}

variable "ServerName" {
  type    = string
  default = "app-server"
}

variable "ami"{}

variable "instance_class" {}

variable "route_table_cidr" {

}

variable "database_ports"{}
variable "app_server_ports" {}
variable "instance_key"{}

