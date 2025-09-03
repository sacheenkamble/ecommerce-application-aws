
#Create IAM Role for EC2 instance profile
resource "aws_iam_role" "ec2IAMrole" {
  name               = "EC2IAMrole" # Replace with your actual IAM role name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#Create IAM Instance Profile
resource "aws_iam_instance_profile" "ec2InstanceProfile" {
  name = "EC2InstanceProfile" # Replace with your actual IAM instance profile name
  role = aws_iam_role.ec2IAMrole.name

}

#Create EC2 instance ASG in the public subnets of the a VPC using ASG module
module "ec2-asg" {
  source = "../../../modules/asg"

  key_name                  = var.key_name                                                                   # Replace with your actual key pair name                                # Path to your user data script
  iam_instance_profile_name = aws_iam_instance_profile.ec2InstanceProfile.name                               # Replace with your actual IAM instance profile name
  instance_type             = var.instance_type                                                              #t3.micro
  subnet_ids                = data.aws_subnets.privatesubnets.ids # List of subnet IDs from the non-prod VPC module
  security_group_id         = data.aws_security_group.nonpprodvpc_sg.id                                      # Security Group ID from the non-prod security group module
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  launch_template_name      = var.launch_template_name
  ami_id                    = var.ami_id # Amazon Linux 2 AMI in us-east-1
  tags = {
    Environment = "Non-Prod"
    Project     = "Ecommerce"
    Owner       = "DevOps"
  }
}