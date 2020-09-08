//Setting Up AWS Provider

provider "aws" {

  profile = "newprofile"

  region  = "ap-south-1"

}

 
//Kubernetes Provider

provider "kubernetes" {

}

 

//Importing AWS Module

module "AWS_module" {

  source = "./AWS"

  vpc_id = var.myvpc

  db_user = var.db_user

  db_pass = var.db_pass

  db_name = var.db_name

}


//Importing Kubernetes Module

module "kubernetes_module" {

  source = "./Kubernetes"

  db_host = module.AWS_module.db_host

  db_user = var.db_user

  db_pass = var.db_pass

  db_name = var.db_name

 

  dependencies = [

    module.AWS_module.db_host

  ]

}

 

//Open Wordpress Site

resource "null_resource" "open_WordPress" {

  provisioner "local-exec" {

    command = "start Edge 192.168.99.102:${module.kubernetes_module.wp_node_port}"

  }

}   