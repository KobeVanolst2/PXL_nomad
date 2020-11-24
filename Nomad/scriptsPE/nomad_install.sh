sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install -y nomad 
sudo systemctl start nomad
sudo systemctl enable nomad
#curl -sSL https://releases.hashicorp.com/nomad/0.12.5/nomad_0.12.5_linux_amd64.zip -o nomad.zip

