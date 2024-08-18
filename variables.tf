variable "region" {
  type = string
  description = "Where your infrastructure will be provisioned (Virginia, Ohio, California, Oregon, Mumbai, Osaka, Seoul, Singapore, Sydney, Tokyo, Canada, Frankfurt, Ireland, London, Paris, Stockholm, Sao Paulo)"
}

variable "aws-region" {
  type = map
  default = {
    "Virginia" = "us-east-1"
    "Ohio" = "us-east-2"
    "California" = "us-west-1"
    "Oregon" = "us-west-2"
    "Mumbai" = "ap-south-1"
    "Osaka" = "ap-northeast-3"
    "Seoul" = "ap-northeast-2"
    "Singapore" = "ap-shoutheast-1"
    "Sydney" = "ap-southeast-2"
    "Tokyo" = "ap-northeast-1"
    "Canada" = "ca-central-1"
    "Frankfurt" = "eu-central-1"
    "Ireland" = "eu-west-1"
    "London" = "eu-west-2"
    "Paris" = "eu-west-3"
    "Stockholm" = "eu-north-1"
    "Sao Paulo" = "sa-east-1"
  }
}  

variable "aws_vpc_cidr" {
  type = string
  default = "172.16.0.0./24"
}
