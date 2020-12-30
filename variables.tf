variable "name_master" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "name_slave" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "instance_count_master" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "instance_count_slave" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "size" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "ami_master" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "ID of IAM for instances"
  type        = string
}

variable "ami_slave" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}


variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}


variable "region" {
  description = "Region where the machine needs to deployed"
  type        = string
  default     = "ap-south-1"
}

