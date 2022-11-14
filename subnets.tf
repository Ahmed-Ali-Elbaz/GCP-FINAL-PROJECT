# Create Management Subnet
resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access  = true
  
}


# Create Restricted Subnet
resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.3.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  
}
