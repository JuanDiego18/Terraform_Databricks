#Imports data from a list of AWS Availability Zones which can be accessed by an AWS account within the region

data "aws_availability_zones" "available" {
  state = "available"
}