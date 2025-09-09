# Output Lambda Function ARN
output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.main.arn
}
# Output Lambda Function Name
output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.main.function_name
}