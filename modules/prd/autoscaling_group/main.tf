
resource "aws_autoscaling_policy" "autoscaling_policy" {
  name                   = "${var.policy_name}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group.name}"
}

resource "aws_autoscaling_group" "autoscaling_group" {
  availability_zones        = ["${var.azs}"]
  name                      = "${var.as_group_name}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.desired_capacity}"
  health_check_grace_period = "${var.health_grace}"
  health_check_type         = "${var.health_type}"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.launch_configuration.name}"
  vpc_zone_identifier       = "${var.vpc_id}"

  tags = [{
    key                 = "Name"
    value               = "${var.instance_name}"
    propagate_at_launch = true
  },{
    key                 = "Env"
    value               = "${var.env}"
    propagate_at_launch = true
  },
  {
    key                 = "System"
    value               = "${var.system}"
    propagate_at_launch = true
  }
  ] 

}


resource "aws_launch_configuration" "launch_configuration" {
  iam_instance_profile = "${var.iam_instance_profile}"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${var.key_name}"
  name_prefix          = "lc-${var.name_prefix}"
  security_groups      = ["${var.security_groups}"]
  associate_public_ip_address = false
  user_data            = "${var.user_data_file}"

  /* root_block_device { */
  ebs_block_device {
  device_name = "/dev/xvdcz"
      volume_size = "${var.volume_size}"
      volume_type = "gp2"
      delete_on_termination = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

