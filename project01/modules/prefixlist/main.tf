
resource "aws_ec2_managed_prefix_list" "example" {
  name           = var.prefix_list_name
  address_family = "IPv4"
  max_entries    = var.max_entries


  entry {
    cidr        = var.cidr_block_entry_1
    description = "Primary"
  }

  entry {
    cidr        = var.cidr_block_entry_2
    description = "Secondary"
  }

  tags = {
    Name = var.prefix_list_name
  }

}