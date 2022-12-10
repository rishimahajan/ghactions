
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "nat_gtw_id" {
  value = aws_nat_gateway.natgtw.*.id
}

output "nat_gtw_ip" {
  value = aws_eip.natgtwip.*.public_ip
}

output "internet_gtw_id" {
  value = aws_internet_gateway.igw.*.id
}

output "web_private_subnet_ids" {
  value = aws_subnet.web_subnet_private.*.id
}

output "app_private_subnet_ids" {
  value = aws_subnet.app_subnet_private.*.id
}

output "db_private_subnet_ids" {
  value = aws_subnet.db_subnet_private.*.id
}

output "lb_public_subnet_ids" {
  value = aws_subnet.lb_subnet_public.*.id
}

output "web_security_group_id" {
  value = aws_security_group.aws-lb-sg.id
}

output "app_security_group_id" {
  value = aws_security_group.aws-lb-sg.id
}

output "db_security_group_id" {
  value = aws_security_group.aws-lb-sg.id
}

output "lb_security_group_id" {
  value = aws_security_group.aws-lb-sg.id
}