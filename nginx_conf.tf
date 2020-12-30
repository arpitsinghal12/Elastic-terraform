data "template_file" "nginx" {
template = <<EOT
events {
  worker_connections  4096;  ## Default: 1024
}

http{
 server {
     listen 80;

     server_name example1.com;

     auth_basic "Restricted Access";
     auth_basic_user_file /etc/nginx/htpasswd.users;

     location / {
         proxy_pass http://localhost:9200;
     }
 }
}
EOT
}

resource "null_resource" "nginx" {
	triggers = {
		template = data.template_file.nginx.rendered		
		}

	provisioner "local-exec"{
		command = "echo '${data.template_file.nginx.rendered}' > elastic-ansible/roles/elastic-search/files/nginx.conf"
		}
}


