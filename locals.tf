# Determine the Selected Region
locals {
  selected_region = var.aws-region[var.region]
  azs_number = length(data.aws_availability_zones.available.names)
}
