resource "aws_ami_from_instance" "aws-ami-instance" {
  for_each                = var.instance_name_ids
  name                    = "${each.key}-new"
  provider                = aws.qa
  source_instance_id      = each.value
  snapshot_without_reboot = true

  tags = {
    Source = "Terraform"
    Name   = "each.key"
  }
}


resource "aws_ami_launch_permission" "aws_ami_permission" {
  for_each   = aws_ami_from_instance.aws-ami-instance
  provider   = aws.qa
  image_id   = each.value.id
  account_id = "889340682220"
}

