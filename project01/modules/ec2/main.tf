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


#Create EC2 instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id   # Specify the AMI ID for Amazon Linux 2023
  instance_type = "t3.micro"                            # Specify the instance type
  subnet_id     = aws_subnet.example.id                # Specify the subnet ID

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  iam_instance_profile = aws_iam_instance_profile.ec2InstanceProfile.name

  metadata_options {
    http_endpoint               = "enabled"  #Enable IMDSv2
    http_tokens                 = "required" #Enforce IMDSv2
    http_put_response_hop_limit = 1
  }

  tags = {
    Name = "tf-example"
  }
}