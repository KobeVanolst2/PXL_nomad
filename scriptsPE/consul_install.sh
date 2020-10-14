sudo apt-get update
sudo apt-get install -y unzip curl wget vim

curl -sSL https://releases.hashicorp.com/consul/1.8.4/consul_1.8.4_linux_amd64.zip -o consul.zip
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d
