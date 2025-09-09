
# Path to find the terragrunt root.hcl file
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# # Define dependencies to fetch outputs from other terragrunt modules
# dependency "vpc" {
#   config_path = "../vpc-nonprod-01"
# }


# Define the Terragrunt source from the Terraform module such as Lambda, EC2, RDS, etc.
terraform {
  source = "../../../modules/lambda"
}

# Define inputs to be passed to the Lambda Terraform module
inputs = {
    function_name          = "nonprod-fileprocessor-lambda"
    lambda_description     = "Non-Prod File Processor Lambda Function"
    aws_region             = "us-east-1"
    lambda_zip_file        = "./lambda_function.zip"
    lambda_handler         = "lambda_function.lambda_handler"
    lambda_runtime         = "python3.12"
    lambda_subnet_ids      = ["subnet-0cc85b1c61b328ad9", "subnet-06f7eb6221c5f660f"]
    lambda_security_group_ids = ["sg-0c35ba9be6793acd0"]
    concurrency_limit      = 5
    tags = {
        Environment = "Non-Prod"
        Project     = "EcommerceApp"
        Owner       = "DevOpsTeam"
    }
}


# --- IGNORE ---