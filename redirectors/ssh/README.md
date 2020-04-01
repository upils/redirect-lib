# SSH

| Type   | Subtype        | Automated | Keep Origin IP | Decrypt |
| ------ | -------------- | --------- | -------------- | ------- |
| `dumb` | `command line` | `no`      | `no`           | `no`    |

## How to

Edit `/etc/ssh/sshd_config`, and uncomment as follow:

```bash
# Allow anyone to connect to forwarded ports
GatewayPorts yes

# Allow both local and remote (to external machines) port forwards
AllowTcpForwarding yes
```

Then, from **the C2 server**, launch:

```bash
ssh <USER>@<REDIRECTOR_IP> -R *:443:localhost:443
```

## Comments

- You need a second `ssh` command to redirect TCP/80

## Resources

- [Reverse SSH Redirectors](https://blog.smallsec.ca/2018/06/16/reverse-ssh-redirectors/)