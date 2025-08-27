
#Define EC2 launch template
resource "aws_launch_template" "example" {
  name_prefix   = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type #t2.micro
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile {
      name = var.iam_instance_profile_name
    }

  tag_specifications {
      resource_type = "instance"
      tags = var.tags
    }
  lifecycle {
      create_before_destroy = true
    }

}

#Define Auto Scaling Group
resource "aws_autoscaling_group" "example" {
  desired_capacity     = var.desired_capacity #2
  max_size             = var.max_size #3
  min_size             = var.min_size #1
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet_ids #list of subnet ids
  
  lifecycle {
    create_before_destroy = true
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
  dimensions = {                                      #Dimensions for the metric
    AutoScalingGroupName = aws_autoscaling_group.example.name  # Auto Scaling group name
  }
  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}
resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "low-cpu-alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2                             # Number of periods over which data is compared to the specified threshold
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120                           # The period in seconds over which the specified statistic is applied
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Alarm when CPU is below 30%"
  dimensions = {                                      #Dimensions for the metric
    AutoScalingGroupName = aws_autoscaling_group.example.name # 
  }
  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}
