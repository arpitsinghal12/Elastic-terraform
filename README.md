# Elastic-terraform
Automated setup for the Elasticsearch using the Terraform and Ansible

### Prerequisite
Terraform and Ansible should be installed on your computer.

### Configuration changes
Edit your variables in the variables/elastic.tfvars accordinglye
```
vim Elastic-terraform/variables/elastic.tfvars
```

### Steps to create the Elasticsearch infrastructure.
```
git clone {{ repo_url }}
cd Elastic-terraform
terraform apply -var-file=./variables/elastic.tfvars
```

### Conclusion
I have used the Terraform to provision the AWS infrastructure of 1 node as a master 2 node as worker. I used the terraform template module to populate the inventory,nginx.conf,elasticsearh confi into the ansible folder. And then use the Terraform provision method to run the ansible script. I have managed to enable the password-protected authentication to the elasticsearch web-server.


