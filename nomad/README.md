# Nomad setup

## Instruction

Nomad should be installed on both server and clinet

### Create consul directories
`mkdir -p /etc/nomad.d/server/` //on server nodes
`mkdir -p /etc/nomad.d/client/` //on client nodes
`mkdir /var/nomad`

### Generate config file

use the template in `server/server.template.hcl` for server
use the template in `client/client.template.hcl` for client

### Start the agent server/client
`nomad agent -config=/etc/nomad.d/server/server.hcl`
`nomad agent -config=/etc/nomad.d/client/client.hcl`

## Starting as a Boot-time Service

Currently, only Ubuntu init script is available. Here are the steps:
- copy the server/nomad.service to `/etc/systemd/system/`
- copy the client/nomad.service to `/etc/systemd/system/`
- run `sudo systemctl daemon-reload`
- run `sudo systemctl start nomad.service`
- run `sudo systemctl enable nomad.service`

## HandBook
https://imaginea.gitbooks.io/consul-devops-handbook/content/


