# Configure the Alicloud Provider

provider "alicloud" {
  access_key = "ALICLOUD_ACCESS_KEY"
  secret_key = "ALICLOUD_SECRET_KEY"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id      = "vpc-abc12345"
  }



