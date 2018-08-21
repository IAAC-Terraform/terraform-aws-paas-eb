resource "aws_elastic_beanstalk_application" "beanstalkapp" {
  count = "${var.create_vpc ? 1 : 0}"
  name        = "${var.env}${var.appname}-0${count.index + 1}"
  description = "${var.description}"

  appversion_lifecycle {
    service_role          = "${var.service_role}"
    max_count             = 128
    delete_source_from_s3 = true
  }
}

resource "aws_elastic_beanstalk_environment" "beanstalkenv" {
  count = "${var.create_vpc ? 1 : 0}"
  name                = "${var.appname}-env0${count.index + 1}"
  application         = "${aws_elastic_beanstalk_application.beanstalkapp.name}"
  cname_prefix = "${var.appname}"
  tier = "${var.tier}"
  #version_label = "${var.version_label}"
  solution_stack_name = "${var.solution_stack_name}"
  wait_for_ready_timeout = "20m"

###=========================== AutoScaling Settings ========================== ###

/*  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "Cooldown"
    value = "360"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "${var.min_size}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "${var.max_size}"
  }

###=========================== ELB Settings ========================== ###

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }

  setting {
    namespace = "aws:elb:listener"
    name      = "ListenerProtocol"
    value     = "HTTP"
  }
  setting {
    namespace = "aws:elb:listener"
    name      = "InstancePort"
    value     = "80"
  }

  setting {
    namespace = "aws:elb:listener"
    name      = "ListenerEnabled"
    value     = "${var.http_listener_enabled  == "true" ? "true" : "false"}"
  }

  setting {
    namespace = "aws:elb:listener:${var.ssh_listener_port}"
    name      = "ListenerProtocol"
    value     = "TCP"
  }
  setting {
    namespace = "aws:elb:listener:${var.ssh_listener_port}"
    name      = "InstancePort"
    value     = "22"
  }

  setting {
    namespace = "aws:elb:listener:${var.ssh_listener_port}"
    name      = "ListenerEnabled"
    value     = true
  }

  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionSettingIdleTimeout"
    value     = "3600"
  }
  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingEnabled"
    value     = "true"
  }
###=========================== Elastic BeanStalk Application Settings ========================== ###
  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "HTTP:80${var.healthcheck_url}"
  }

###=========================== AutoScaling Launch Configuration Settings ========================== ###

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "${var.iam_instance-profile}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "${var.instance_type}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     = "tcp, 22, 22, ${var.ssh_source_restriction}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = "${var.root_volume_size}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = "${var.root_volume_type}"
  }



###=========================== BeanStalk Environment Settings ========================== ###

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "${var.environment_type}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "${var.lb_type}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "${var.service_role}"
  }

 ###=========================== EC2 Settings ========================== ###


  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${var.vpcid}"
  }
  
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "${var.associate_public_ip_address}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${join(",", var.public_subnets)}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${join(",", var.private_subnets)}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "${var.rolling_update_type}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = true
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = "${var.updating_max_batch}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "${var.updating_min_in_service}"
  }*/

tags {
      env = "${var.env}"
      Name = "${var.env}${var.appname}-0${count.index + 1}"
  }
}