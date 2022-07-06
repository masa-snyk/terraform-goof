variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "ami" {
  type        = string
  description = "ami used for ec2 instance. example - ami-07336266b2c69c546 (terraform-goof-example-ami)"
  default     = "ami-017c2841afa495c38"
}

variable "s3_acl" {
  type    = string
  default = "public-read-write"
}

variable "env" {
  type    = string
  default = "masadev"
}

variable "prefix" {
  type    = string
  default = "masa"
}
