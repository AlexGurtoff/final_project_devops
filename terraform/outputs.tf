### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  WebServer-ip = aws_eip.my_static_ip.public_ip,
  WebServer-id = aws_instance.WebServer.id,
  WebServer-name = aws_instance.WebServer.tags.Name
 }
 )
 filename = "/var/lib/jenkins/inventory"
}