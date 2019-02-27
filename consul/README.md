# Consul

Consul setup

## Instruction

it's recommanded to have at least three server nodes per data center. The rest of the nodes should be just clients.

### Generate key
`consul keygen`

### Create consul directories
`mkdir -p /etc/consul.d/server/` //on server nodes
`mkdir -p /etc/consul.d/client/` //on client nodes
`mkdir /var/consul`

### Generate config file

use the template in `server/config.template.json` for server
use the template in `client/config.template.json` for client

### Start the agent server/client
`consul agent -config-dir /etc/consul.d/server/`
consul agent -config-dir /etc/consul.d/client/

## Starting as a Boot-time Service

Currently, only Ubuntu init script is available. Here are the steps:
- copy the server/consul.service to `/etc/systemd/system/`
- copy the client/consul.service to `/etc/systemd/system/`
- run `sudo systemctl daemon-reload`
- run `sudo systemctl start consul.service`
- run `sudo systemctl enable consul.service`

## HandBook
https://imaginea.gitbooks.io/consul-devops-handbook/content/


