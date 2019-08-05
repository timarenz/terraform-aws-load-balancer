output "id" {
  value = aws_elb.main.id
}

output "name" {
  value = aws_elb.main.name
}

output "dns_name" {
  value = aws_elb.main.dns_name
}

output "instances" {
  value = aws_elb.main.instances
}

output "source_security_group" {
  value = aws_elb.main.source_security_group
}

output "source_security_group_id" {
  value = aws_elb.main.source_security_group_id
}

output "zone_id" {
  value = aws_elb.main.zone_id
}
