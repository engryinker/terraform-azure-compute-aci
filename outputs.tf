output "container_groups" {
  description = "Map (same keys as var.container_groups) of every output from each container instance groups created -- see upstream module docs for the full shape."
  value       = module.container_group
}
