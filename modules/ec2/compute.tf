

variable "availability_zone" {}
variable "associate_public_ip_address" {
  type = bool
  default = true
}
variable "tags" {}
/*
resource "aws_instance" "web_instance" {
  count = var.instance_count
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
#  key_name          = var.ssh_key_name
  security_groups   = var.vpc_security_group_ids
  subnet_id         = element(var.subnet_id, count.index)
  source_dest_check = false
  associate_public_ip_address = var.associate_public_ip_address

  tags = var.tags

}*/


# Bootstrapping PowerShell Script
data "template_file" "windows-userdata" {
  count = var.instance_count
  template = <<EOF
<powershell>
# Rename Machine
Rename-Computer -NewName "${var.instance_name_prefix}{count.index}" -Force;
# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools;
# Restart machine
shutdown -r -t 10;
</powershell>
EOF
}


# Create EC2 Instance
resource "aws_instance" "web_instance" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_id, count.index)
  vpc_security_group_ids = var.vpc_security_group_ids
  source_dest_check = false
 # key_name = aws_key_pair.key_pair.key_name
  user_data = data.template_file.windows-userdata[count.index].rendered
  associate_public_ip_address = var.associate_public_ip_address

  # root disk
#  root_block_device {
#    volume_size           = var.windows_root_volume_size
#    volume_type           = var.windows_root_volume_type
#    delete_on_termination = true
#    encrypted             = true
#  }  # extra disk
#  ebs_block_device {
#    device_name           = "/dev/xvda"
#    volume_size           = var.windows_data_volume_size
#    volume_type           = var.windows_data_volume_type
#    encrypted             = true
#    delete_on_termination = true
#  }

    tags = merge(
    { "Name" = "${var.instance_name_prefix}${count.index}" },
    var.tags,
  )
}

# Create Elastic IP for the EC2 instance
#resource "aws_eip" "instance-eip" {
#  vpc  = true
#  tags = {
#    Name = "windows-eip"
#  }
#}# Associate Elastic IP to Windows Server
#resource "aws_eip_association" "windows-eip-association" {
#  instance_id   = aws_instance.windows-server.id
#  allocation_id = aws_eip.windows-eip.id
#}

