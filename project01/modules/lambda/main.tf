
# Define IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_execution_role" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


# Define a Terraform module for AWS Lambda function deployment
resource "aws_lambda_function" "main" {

## Required arguments for Lambda function ################
  function_name = var.function_name
  role          = aws_iam_role.lambda_execution_role.arn
  
## Optional arguments for Lambda configuration ############
  description = var.lambda_description
  region = var.aws_region
  architectures = ["x86_64"]

  # Source Code for the Lambda function
  filename      = var.lambda_zip_file
  source_code_hash = filebase64sha256(var.lambda_zip_file)

  # Define how the Lambda function is packaged and executed
  package_type = "Zip"
  handler       = var.lambda_handler

  # Define the runtime environment for the Lambda function
  runtime       = var.lambda_runtime
  timeout = 15
  memory_size = 256

  # Define reserved concurrency Limits for the Lambda function
  reserved_concurrent_executions = var.concurrency_limit

  # Logging settings for Lambda function
  logging_config {
    application_log_level = "INFO"
    log_format = "JSON"
  }

#   # Define X-Ray tracing configuration
#   tracing_config {
#     mode = "Active"
#   }

#   # Dead-letter queue configuration
#   dead_letter_config {
#     target_arn = var.lambda_dead_letter_target_arn
#   }

  # Define VPC configuration for the Lambda function
  vpc_config {
    subnet_ids         = var.lambda_subnet_ids
    security_group_ids = var.lambda_security_group_ids
  }
    # Define tags for the Lambda function
  tags = var.tags

}