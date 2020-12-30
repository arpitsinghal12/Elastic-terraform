output "public_ip" {
  description = "minio cluster information"
  value       = module.ec2_cluster_master.public_ip[0]
}


