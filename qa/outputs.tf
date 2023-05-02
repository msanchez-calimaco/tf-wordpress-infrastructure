output "lb_dns_name" {
  value = module.wordpress.lb_dns_name
}
output "vpc_id" {
  value = module.wordpress.vpc_id
}
output "public_subnet_ids" {
  value = module.wordpress.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.wordpress.private_subnet_ids
}

output "wp_module_version" {
  value = var.wp_module_version
}