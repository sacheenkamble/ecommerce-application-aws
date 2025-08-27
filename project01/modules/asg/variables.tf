
#Define launch_template_name variable
variable "launch_template_name" {
  description = "The name of the launch template"
  type        = string
  default     = "example-launch-template"
}

#Define ami_id variable
variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
  default = "ami-0a232144cf20a27a5"
}

#Define instance_type variable
variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t3.micro"
}

#Define key_name variable
variable "key_name" {
  description = "The key pair name to access the EC2 instances"
  type        = string
  default = "my-key-pair"
}


#Define security_group_id variable
variable "security_group_id" {
  description = "The security group ID to associate with the EC2 instances"
  type        = string
  default = ""
}

#Define subnet_ids variable
variable "subnet_ids" {
  description = "The list of subnet IDs for the Auto Scaling group"
  type        = list(string)
  default = [ "" ]
}

#Define iam_instance_profile_name variable
variable "iam_instance_profile_name" {
  description = "The IAM instance profile name to associate with the EC2 instances"
  type        = string
  default = ""
}

#Define desired_capacity variable
variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group"
  type        = number
  default     = 2
} 
#Define max_size variable
variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 3
}
#Define min_size variable
variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 1
}

#Define tags variable
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "nonprod"
    Project     = "ecommerce"
    Owner       = "team-a"

  }
}
