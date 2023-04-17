resource "aws_launch_template" "asg_apache_terra_template" {
  name                   = "My-ASG-Template"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = var.security_group
  user_data = filebase64("${path.module}/apache-installation-script.sh")
}

resource "aws_autoscaling_group" "asg_apache_terra_group" {
  name                = var.asg_group_name
  min_size            = var.asg_min_value
  max_size            = var.asg_max_value
  desired_capacity    = var.asg_min_value
  vpc_zone_identifier = var.vpc_zone_identifier
  launch_template {
    id = aws_launch_template.asg_apache_terra_template.id
  }

  tag {
    key                 = "Name"
    value               = "My-ASG-Group"
    propagate_at_launch = true
  }
}