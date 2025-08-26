
#Define name variable for the prefix list
variable "prefix_list_name" {
  description = "The name of the prefix list"
  type        = string
}

#Define CIDR block variable for the prefix list
variable "cidr_block_entry_1" {
  description = "The IPv4 CIDR block to include in the prefix list"
  type        = string
}

#Define second CIDR block variable for the prefix list
variable "cidr_block_entry_2" {
  description = "The second IPv4 CIDR block to include in the prefix list"
  type        = string
}


#Define max entries variable for the prefix list
variable "max_entries" {
  description = "The maximum number of entries for the prefix list"
  type        = number
  default     = 5
}