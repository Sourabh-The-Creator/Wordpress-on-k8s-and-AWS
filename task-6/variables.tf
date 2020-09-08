//Creating Variable for VPC

variable "myvpc" {

  type    = string

  default = "vpc-a2ebf6ca"

  description = "VPC ID"

}

//Variable for Database user

variable "db_user" {

     type = string

     default = "Sourabh"

     description = "MySQL user"

}

//Variable for Database password

variable "db_pass" {

     type = string

     default = "password"

     description = "Password for MySQL Database"

}

//Variable for Database Name

variable "db_name" {

  type = string

  default = "Wordpress_DB"

  description = "MySQL Database Name"

}