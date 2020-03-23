
# kubernetes cluster
resource "digitalocean_kubernetes_cluster" "staging" {
  name    = "staging"
  region  = "ams3"
  version = "1.16.6-do.2"
  tags    = ["staging"]

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 5
  }
}