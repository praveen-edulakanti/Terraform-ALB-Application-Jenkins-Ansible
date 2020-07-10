resource "aws_instance" "PublicInstance" {
	count = length(var.PublicInstances)
	 ami = lookup(var.PublicInstances[count.index], "ami")
	 availability_zone = lookup(var.PublicInstances[count.index], "availability_zone")
	 instance_type = lookup(var.PublicInstances[count.index], "instance_type")
	 key_name = lookup(var.PublicInstances[count.index], "key_name")
	 subnet_id = var.public_subnetID[count.index]
	 associate_public_ip_address = lookup(var.PublicInstances[count.index], "associate_public_ip_address")
	 user_data = file(lookup(var.PublicInstances[count.index], "user_data"))
	 vpc_security_group_ids = [var.PublicSecurityGrpID]
	 
	tags = {
		Name = format("${var.environment}-%s", lookup(var.PublicInstances[count.index], "name"))
		Environment = var.environment
        Project = var.project
	    Terraformed = "True"
	}
}

resource "aws_instance" "PrivateInstance" {
	 count = length(var.PrivateInstances)
	 ami = data.aws_ami.latest-ubuntu.id
	 availability_zone = lookup(var.PrivateInstances[count.index], "availability_zone")
	 instance_type = lookup(var.PrivateInstances[count.index], "instance_type")
	 key_name = lookup(var.PrivateInstances[count.index], "key_name")
	 subnet_id = var.private_subnetID[count.index]
	 associate_public_ip_address = lookup(var.PrivateInstances[count.index], "associate_public_ip_address")
	 vpc_security_group_ids = [var.PrivateSecurityGrpID]

	tags = {
		Name = format("${var.environment}-%s", lookup(var.PrivateInstances[count.index], "name"))
		Environment = var.environment
        Project = var.project
	    Terraformed = "True"
	}
}

data "aws_ami" "latest-ubuntu" {
 most_recent = true
 owners = ["863896359115"] # Canonical

  filter {
      name   = "name"
      values = ["Packer_UbuntuApachePhp *"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

resource "null_resource" "ConfigureAnsibleLabelVariable" {
  triggers = {
    always_run = "${timestamp()}"
  }
  /*provisioner "local-exec" {
    #command = "echo [${var.dev_host_label}:vars] > hosts"
	command = "echo [terra_ansible_host:vars] > hosts"
  }
  provisioner "local-exec" {
    #command = "echo ansible_ssh_user=${var.ssh_user_name} >> hosts"
	command = "echo ansible_ssh_user=ubuntu >> hosts"
  }
  provisioner "local-exec" {
    #command = "echo ansible_ssh_private_key_file=${var.ssh_key_path} >> hosts"
	command = "echo ansible_ssh_private_key_file=~/.ssh/terraform-demo.pem >> hosts"
  }*/
  provisioner "local-exec" {
    #command = "echo [${var.ansible_host_label}] >> hosts"
	command = "echo [WebServer] > hosts"
  }
}

resource "null_resource" "ProvisionRemoteHostsIpToAnsibleHosts" {
	
	count = length(var.PrivateInstances)
	triggers = {
     always_run = "${timestamp()} + count.index"
    }
	/*
	connection {
    	type = "ssh"
    	user = "ubuntu"
    	host = "${element(aws_instance.PrivateInstance.*.private_ip, count.index)}"
    	#private_key = file("~/.ssh/terraform-demo.pem")
		private_key = file("C://Users//pedulakanti//Downloads//terraform-demo.pem")
    }*/
	provisioner "local-exec" {
       command = "echo ${element(aws_instance.PrivateInstance.*.private_ip, count.index)} >> hosts"
	   on_failure = continue
    }
}
