data "template_file" "inventory" {
template = <<EOT
[elasticsearch]
${module.ec2_cluster_master.private_ip[0]}  ansible_user=ubuntu ansible_ssh_private_key_file=/home/adm_arpit/.ssh/private_ec2_key.pem

[elasticsearch_slave
${module.ec2_cluster_slave.private_ip[0]}  ansible_user=ubuntu ansible_ssh_private_key_file=/home/adm_arpit/.ssh/private_ec2_key.pem
${module.ec2_cluster_slave.private_ip[1]}  ansible_user=ubuntu ansible_ssh_private_key_file=/home/adm_arpit/.ssh/private_ec2_key.pem


EOT
}

resource "null_resource" "update_inventory" {
	triggers = {
		template = data.template_file.inventory.rendered		
		}

	provisioner "local-exec"{
		command = "echo '${data.template_file.inventory.rendered}' > elastic-ansible/inventory"
		}
}


