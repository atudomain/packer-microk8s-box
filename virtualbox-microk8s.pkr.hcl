
source "vagrant" "ubuntu" {
  communicator = "ssh"
  source_path  = "bento/ubuntu-20.04"
  provider     = "virtualbox"
  add_force    = true
}

build {
  sources = ["source.vagrant.ubuntu"]
  provisioner "shell" {
    script = "./install-microk8s.sh"
  }
}
