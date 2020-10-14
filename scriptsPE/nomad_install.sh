sudo apt-get update
sudo apt-get install -y unzip curl wget vim

curl -sSL https://releases.hashicorp.com/nomad/0.12.5/nomad_0.12.5_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d
