resource "null_resource" "elastic-setup" {
		
	provisioner "local-exec"{
		command = "ansible-playbook -i elastic-ansible/inventory elastic-ansible/main.yml"
	}

	triggers = {
	template = data.template_file.inventory.rendered
	cluster_instance_ids = join( ",",[
		module.ec2_cluster_master.id[0],
		module.ec2_cluster_slave.id[0]]
	)
				
	}
	
	depends_on = [
		null_resource.update_inventory,
		module.ec2_cluster_master[0],
		module.ec2_cluster_slave[0]
		]
}
