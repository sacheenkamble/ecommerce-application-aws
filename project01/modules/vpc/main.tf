
# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_01
  enable_dns_hostnames = true
  enable_dns_support   = true
  

    tags = {
        Environment = var.environment
        Name        = var.vpc_name
        Project     = var.project
    }
}

# Create public subnets (one per selected AZ)
resource "aws_subnet" "public_subnet" {
  count             = 2 # For two Availability Zones
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_01, 8, count.index) # 8 new bits for /24 subnets from a /16 VPC
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSub-${count.index + 1}"
  }
}

# Create private subnets (two per selected AZ)
resource "aws_subnet" "private_subnet_az1" {
  count             = 2 # Two private subnets in the first AZ
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_01, 8, count.index + 2)  # Example CIDR blocks, adjusting offset
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "PrivateSubnet-AZ1-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  count             = 2 # Two private subnets in the second AZ
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_01, 8, count.index + 4) # Example CIDR blocks, adjusting offset
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "PrivateSubnet-AZ2-${count.index + 1}"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

# Create a public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "PublicRT"
  }
}

# Create a route to the Internet Gateway in the public route table
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Create a route table for private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "PrivateRT"
  }
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_subnet_az1_assoc" {
  count          = length(aws_subnet.private_subnet_az1)
  subnet_id      = aws_subnet.private_subnet_az1[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_az2_assoc" {
  count          = length(aws_subnet.private_subnet_az2)
  subnet_id      = aws_subnet.private_subnet_az2[count.index].id
  route_table_id = aws_route_table.private_rt.id
}