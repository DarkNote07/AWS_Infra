variable "vpc_cidr_block" {
  type = string
}

variable "vpc" {
  type = string
}

variable "igw" {
  type = string
}

variable "subnet_public" {
  type = list(string)
}

variable "subnet_private" {
  type = list(string)
}

variable "az" {
  type = list(string)
}

variable "psb" {
  type = string
}

variable "privtsb" {
  type = string
}

variable "proute" {
  type = string
}