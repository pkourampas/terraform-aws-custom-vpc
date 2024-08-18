# Determine the Selected Region
locals {
  selected_region = var.aws-region[var.region]
}
