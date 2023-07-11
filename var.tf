variable "instance_name" {
  description = "Instance Name"
  type        = string
  default     = "Terraform 2048"
}

variable "ssh_key" {
  description = "SSH-key name"
  type        = string
  default     = "github-actions"
}

variable "instance_ami" {
  description = "Instance AMI"
  type        = string
  default     = "ami-05432c5a0f7b1bfd0" // Amazon Linux 2023
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
