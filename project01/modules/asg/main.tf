
#Define EC2 launch template
resource "aws_launch_template" "example" {
  name_prefix   = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type #t2.micro
  user_data = base64encode(<<EOF
   #!/bin/bash
   echo "Hello from user data!" > /tmp/user_data_output.txt
  sudo apt-get update -y
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  EOF
  ) #Base64 encoded user data script
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  metadata_options {
    http_endpoint               = "enabled"  #Enable IMDSv2
    http_tokens                 = "required" #Enforce IMDSv2
    http_put_response_hop_limit = 1
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
  lifecycle {
    create_before_destroy = true
  }

}

#Define Auto Scaling Group
resource "aws_autoscaling_group" "example" {
  desired_capacity = var.desired_capacity #2
  max_size         = var.max_size         #3
  min_size         = var.min_size         #1
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet_ids #list of subnet ids

  #health_check_type = "elb" # Use ELB health checks
  health_check_grace_period = 300 # Grace period for health checks

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "example-asg-instance"
    propagate_at_launch = true
  }

}

#Define Auto Scaling Policy
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.example.name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
}
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  autoscaling_group_name = aws_autoscaling_group.example.name
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
}

#Define CloudWatch Alarms for scaling
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU exceeds 70%"
  dimensions = {                                              #Dimensions for the metric
    AutoScalingGroupName = aws_autoscaling_group.example.name # Auto Scaling group name
  }
  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}
resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "low-cpu-alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2 # Number of periods over which data is compared to the specified threshold
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120 # The period in seconds over which the specified statistic is applied
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Alarm when CPU is below 30%"
  dimensions = {                                              #Dimensions for the metric
    AutoScalingGroupName = aws_autoscaling_group.example.name # 
  }
  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}
