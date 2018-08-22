variable "solution_stack_name" {
    default = "64bit Amazon Linux 2018.03 v2.7.2 running Python 3.6"
}

variable "tier" {
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
}

variable "env" {}

variable "appname" {}

variable "description" {
    default = "sample applicitoion"
}

variable "version_label" {
  default     = ""
  description = "Elastic Beanstalk Application version for deploy"
}

variable "vpcid" {}

variable "public_subnets" {
    type = "list"
}

variable "service_role" {}

variable "associate_public_ip_address" {
    default = "true"
}

variable "iam_instance-profile" {
    default = "aws-elasticbeanstalk-ec2-role"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "min_size" {
    default = 1
}

variable "max_size" {
    default = 3
}

variable "create_vpc" {}

variable "updating_min_in_service" {}

variable "updating_max_batch" {}

variable "rolling_update_type" {}

variable "private_subnets" {
    type =  "list"
}

variable "ssh_source_restriction" {}

variable "root_volume_size" {}

variable "root_volume_type" {}

variable "ssh_listener_port" {
  default     = "22"
  description = "SSH port"
}

variable "http_listener_enabled" {
    default = true


variable "https_listener_enabled" {
    default = false
}

variable "healthcheck_url" {
  default     = "/healthcheck"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "environment_type" {
    default = "SingleInstance"
}

variable "lb_type" {
    default = "classic"
}