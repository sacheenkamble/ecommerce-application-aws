
# Define required Function Name for Lambda
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}
# # Define required Lambda Execution Role ARN
# variable "lambda_execution_role_arn" {
#   description = "ARN of the IAM role that Lambda assumes when it executes your function"
#   type        = string
# }
# Define Lambda Description
variable "lambda_description" {
  description = "Description of the Lambda function"
  type        = string
  default     = "File Processor Lambda Function"
}
# Define AWS Region
variable "aws_region" {
  description = "AWS region where the Lambda function will be deployed"
  type        = string
  default     = "us-east-1"
}
# Define Lambda Zip File Path
variable "lambda_zip_file" {
  description = "Path to the zip file containing the Lambda function code"
  type        = string
}
# Define Lambda Handler
variable "lambda_handler" {
  description = "The function within your code that Lambda calls to begin execution"
  type        = string
  default     = "lambda_function.lambda_handler"
}
# Define Lambda Runtime
variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.12"
}
# Define VPC Subnet IDs for Lambda
variable "lambda_subnet_ids" {
  description = "List of VPC subnet IDs for the Lambda function"
  type        = list(string)
  default     = []
}
# Define VPC Security Group IDs for Lambda
variable "lambda_security_group_ids" {
  description = "List of VPC security group IDs for the Lambda function"
  type        = list(string)
  default     = []
}
# Define Reserved Concurrency Limit for Lambda
variable "concurrency_limit" {
  description = "The maximum number of concurrent executions for the Lambda function"
  type        = number
  default     = 5
}
# Define Tags for Lambda Function
variable "tags" {
  description = "A map of tags to assign to the Lambda function"
  type        = map(string)
  default     = {
    Environment = "Non-Prod"
    Project     = "Project01"
    Owner       = "DevOpsTeam"
  }
}
# # Define Dead Letter Queue Target ARN
# variable "lambda_dead_letter_target_arn" {
#   description = "ARN of the target resource for the dead-letter queue"
#   type        = string
#   default     = ""
# }


