
# Create an Application Load Balancer (ALB)
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.alb_subnet_ids

  enable_deletion_protection = true

/*   access_logs {
    bucket  = var.alb_access_log_bucket
    prefix  = var.alb_access_log_prefix
    enabled = true
  }
    tags = var.tags */
}

# Create Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Security group for the Application Load Balancer"
  vpc_id      = var.vpc_id
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        description = "Allow any https traffic"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        description = "Allow any http traffic"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "All any traffic from ALB to internal servers"
        cidr_blocks = ["10.0.0.0/0"]
    }
    tags = var.tags
}

# Create a target group for the ALB
resource "aws_lb_target_group" "my_target_group" {
  name     = "nonprod-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
    health_check {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200-399"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
    }
    tags = var.tags
}

#Create Autoscaling attachment to link ALB target group with ASG
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.asg_name
  lb_target_group_arn    = aws_lb_target_group.my_target_group.arn
}



# Create a listener for the ALB
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.alb_certificate_arn # Replace with your ACM certificate ARN
  default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.my_target_group.arn
    }
  tags = var.tags
}

