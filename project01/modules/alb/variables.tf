
#Define variables for VPC id
variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
}

# Define variables for the ALB module
variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "nonprod-alb"
}

variable "alb_internal" {
  description = "Boolean to specify if the ALB is internal"
  type        = bool
  default     = false
}


# List of subnet IDs for the ALB
variable "alb_subnet_ids" {
  description = "A list of subnet IDs to attach to the ALB"
  type        = list(string)
}

# S3 bucket for ALB access logs
variable "alb_access_log_bucket" {
  description = "The S3 bucket to store ALB access logs"
  type        = string
  default     = "my-alb-access-logs-bucket"
}

# Prefix for the ALB access log files
variable "alb_access_log_prefix" {
  description = "The prefix for the ALB access log files"
  type        = string
  default     = "alb/nonprod-alb-logs"
}

# Tags to assign to the ALB
variable "tags" {
  description = "A map of tags to assign to the ALB"
  type        = map(string)
  default = {
    Environment = "Non-prod"
    Project     = "ecommerce"
  }
}

# ASG name to attach to the ALB
variable "asg_name" {
  description = "The name of the Auto Scaling Group to attach to the ALB"
  type        = string
  default     = "nonprod-app-asg"
}


# Define variable for ALB certificate ARN
variable "alb_certificate_arn" {
  description = "The ACM certificate arn for ALB"
  type        = string
  default     = "arn"

}