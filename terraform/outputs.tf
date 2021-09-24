### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  WebServer-ip = data.aws_instances.my_instances.public_ips,
  names = data.aws_instances.my_instances.ids
 }
 )
 filename = "/var/lib/jenkins/inventory"
}