output "ami-ids" {
  value = [for k,v in aws_ami_from_instance.aws-ami-instance: v.id]
}
