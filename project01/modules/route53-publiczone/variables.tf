
# Define variables for the Route 53 private hosted zone module
variable "vpc_id" {
  description = "The ID of the VPC to associate with the private hosted zone"
  type        = string
}

# Define variable for tags
variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default = {
    Environment = "Non-Production"
    Project     = "Ecommerce Application"
    Owner       = "DevOps Team"
  }
}

# Define variable for private zone name
variable "public_zone_name" {
  description = "The name of the private hosted zone"
  type        = string
  default     = "blissandbake.com"
}