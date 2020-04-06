# Nginx

| Type    | Subtype      | Automated | Keep Origin IP                | Decrypt                      |
| ------- | ------------ | --------- | ----------------------------- | ---------------------------- |
| `smart` | `web server` | `yes`     | `yes` (if proxyprotocol used) | `no` (if proxyprotocol used) |

## How to

### Installation

1. `nginx` is available in package repository, so for example on ubuntu/debian:

    ```bash
    sudo apt install nginx-full
    ```

2. Then copy the template file from `./ansible/roles/redirect_nginx/templates/nginx.conf.j2`, rename it `nginx.conf`, and copy it in `/etc/nginx/`
3. Replace `{{ vars }}` by your values in this file.

### Launch

If `nginx` was installed using the package manager, a service is keeping it running. So you can reload it:

```bash
systemctl reload nginx.service
```

## Comments

- The given configuration file is only redirecting everything to the C2, without any filtering. Some tweaking is needed to make this method "smart".

## Resources

N/A
