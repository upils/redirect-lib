# HAproxy

| Type    | Subtype      | Automated | Keep Origin IP                | Decrypt |
| ------- | ------------ | --------- | ----------------------------- | ------- |
| `smart` | `web server` | `no`      | `yes` (if proxyprotocol used) | `yes`   |

## How to

### Installation

1. `haproxy` is available in package repository, so for example on ubuntu/debian:

    ```bash
    sudo apt install haproxy
    ```

2. Then copy the template file from `./ansible/roles/redirect_haproxy/templates/haproxy.conf.j2`, rename it `haproxy.cfg`, and copy it in `/etc/haproxy/`
3. Replace `{{ vars }}` by your values in this file.

### Launch

If `haproxy` was installed using the package manager, a service is keeping it running. So you can reload it:

```bash
systemctl reload haproxy.service
```

## Comments

- The given configuration file is only redirecting everything to the C2, without any filtering. Some tweaking is needed to make this method "smart".

## Resources

- [haproxy.cfg adapted from outflanknl/RedELK project](https://github.com/outflanknl/RedELK/blob/master/example-data-and-configs/HAProxy/haproxy.cfg)
- [d3vzer0/cnc-relay](https://github.com/d3vzer0/cnc-relay/blob/master/relay/haproxy/haproxy.cfg)
