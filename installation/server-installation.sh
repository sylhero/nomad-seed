apt-get install -y wget unzip
wget -N https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip
wget -N https://releases.hashicorp.com/nomad/0.8.4/nomad_0.8.4_linux_amd64.zip
unzip consul_1.2.2_linux_amd64.zip
unzip nomad_0.8.4_linux_amd64.zip
mv consul nomad /usr/local/bin
mkdir /var/consul
mkdir /var/nomad
mkdir -p /etc/consul.d/server/
mkdir -p /etc/nomad.d/server/
mv /consul/server/consul.service /etc/systemd/system/
mv /nomad/server/nomad.service /etc/systemd/system/
systemctl daemon-reload
systemctl start consul.service
sleep 5
systemctl start nomad.service
systemctl enable consul.service
systemctl enable nomad.service

