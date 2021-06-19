
source "vagrant" "focal64" {
  communicator = "ssh"
  source_path  = "ubuntu/focal64"
  provider     = "virtualbox"
  add_force    = true
}

build {
  sources = ["source.vagrant.focal64"]
}
