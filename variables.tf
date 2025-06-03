variable "region" {
  default = "eu-central-1"
}


variable "container_image" {
  default = "kapilghule/simpletimeservice:latest"
}

variable "app_name" {
  default = "simpletimeservice"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

