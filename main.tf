provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

# Create a web server
resource "alicloud_instance" "web" {
  image_id             = data.alicloud_images.default.images.0.id
  internet_charge_type = var.internet_charge_type
  instance_type        = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category = var.system_disk_category
  security_groups      = [alicloud_security_group.default.id]
  instance_name        = var.instance_name
  vswitch_id           = var.vswitch_id
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id
}