variable "health_check_path" {
  default = "/"
}

variable "app_port" {
  default     = "80"
  description = "portexposed on the docker image"
}

variable "vpc_id" {
  type = string

}

variable "Public_subnets_id" {
  
}