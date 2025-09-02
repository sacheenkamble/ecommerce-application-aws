#Auto Scaling Group with Launch Template, Scaling Policies, and CloudWatch Alarms
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