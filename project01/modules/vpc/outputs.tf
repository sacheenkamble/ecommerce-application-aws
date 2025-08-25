
# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
# Output the public subnet IDs
output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}
# Output the private subnet IDs
output "private_subnet_az1_ids" {
  value = aws_subnet.private_subnet_az1[*].id
}
output "private_subnet_az2_ids" {
  value = aws_subnet.private_subnet_az2[*].id
} 

# Output the Internet Gateway ID
output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
