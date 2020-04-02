# Iptables

| Type   | Subtype        | Automated | Keep Origin IP | Decrypt |
| ------ | -------------- | --------- | -------------- | ------- |
| `dumb` | `command line` | `yes`     | `no`           | `no`    |

## How to

```bash
iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination <C2_IP>
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -I FORWARD -j ACCEPT
iptables -P FORWARD ACCEPT
sysctl net.ipv4.ip_forward=1
```

:warning: Do not forget to make it persistent. Two of the possible solutions:

```bash
# install iptables-persistent
sudo apt-get install iptables-persistent

# Save the rules
sudo iptables-save > /etc/iptables/rules.v4
```

Or, for recent Ubuntu versions:

```bash
# install iptables-persistent
sudo apt-get install iptables-persistent

# Save the rules
sudo netfilter-persistent save
```

## Comments

N/A

## Resources

N/A
