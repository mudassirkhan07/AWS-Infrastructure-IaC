#variable to use ubuntu image

variable "ubuntu_old_image" {
  description = "Ubuntu 24 LTS image ID"
  type        = string
  default     = "ami-0f8a61b66d1accaee"
}

#varible to use instance type
variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}
#variablr of thhe server name
variable "name" {
  description = "name of the instance"
  type        = string
  default     = "stage_server"
}