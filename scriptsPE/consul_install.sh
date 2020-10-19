sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install -y consul
sudo systemctl start consul
sudo systemctl enable consul

#curl -sSL https://releases.hashicorp.com/consul/1.8.4/consul_1.8.4_linux_amd64.zip -o consul.zip

