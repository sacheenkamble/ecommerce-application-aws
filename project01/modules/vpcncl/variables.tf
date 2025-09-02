
#Define VPC name variable
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}


#Define VPC ID variable
variable "vpc_id" {
  description = "The ID of the VPC where the Network ACL will be created"
  type        = string

}