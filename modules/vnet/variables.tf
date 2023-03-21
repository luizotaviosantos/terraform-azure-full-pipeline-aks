variable "name" {
  description = "Name of Virtual Network"
  type    = string
}

variable "subnet0_name" {
  description = "Name of Virtual Network"
  type    = string
}

variable "subnet1_name" {
  description = "Name of Virtual Network"
  type    = string
}


variable "location" {
  description = "Region of Virtual Network"
  type    = string
}


variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
}


variable "address_space" {
  description = "CIDR of Virtual Network"
  type    = list
} 

variable "subnet0_cidr" {
  description = "CIDR of Subnet 0 Private"
  type    = list
}

variable "subnet1_cidr" {
  description = "CIDR of Subnet 1 Public"
  type    = list
}
