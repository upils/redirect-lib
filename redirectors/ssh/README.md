# SSH

| Type   | Subtype        | Automated | Keep Origin IP | Decrypt |
| ------ | -------------- | --------- | -------------- | ------- |
| `dumb` | `command line` | `yes`     | `no`           | `no`    |

## How to

### Install

Edit `/etc/ssh/sshd_config`, and uncomment as follow:

```bash
# Allow anyone to connect to forwarded ports
GatewayPorts yes

# Allow both local and remote (to external machines) port forwards
AllowTcpForwarding yes
```

### Launch

From **the C2 server**, launch:

```bash
ssh <USER>@<REDIRECTOR_IP> -R *:443:localhost:443
```

## Comments

- To redirect another port in the same SSH session, add another `-R *:<REMOTE_PORT>:localhost:<LOCAL_PORT>` block to the command line.

## Resources

- [Reverse SSH Redirectors](https://blog.smallsec.ca/2018/06/16/reverse-ssh-redirectors/)