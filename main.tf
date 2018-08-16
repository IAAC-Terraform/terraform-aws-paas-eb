provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

data "aws_availability_zones" "available" {}

module "paas-elasticbeanstalk" {
  source = "./modules/paas/"
  version = "1.0.0"
  env = "${var.env}"
  appname = "sampleapp"
  role_name = "aws-elasticbeanstalk-service-role"
  #service_role = "${module.beanstalk-role.rolearn}"
  tier = "WebServer" # e.g. ('WebServer', 'Worker')
  vpcid = "${module.core-network-vpc.id}"
  version_label = "sample-v0.1"
  public_subnet = "${module.public-frontend-subnet-primary.subnetid}"
}