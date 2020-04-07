# Apache

| Type    | Subtype      | Automated | Keep Origin IP                | Decrypt |
| ------- | ------------ | --------- | ----------------------------- | ------- |
| `smart` | `web server` | `yes`     | `yes` (if proxyprotocol used) | `yes`   |

## How to

## Install

1. `apache2` is available in package repository, so for example on ubuntu/debian:

    ```bash
    sudo apt install apache2
    ```

2. Enable needed modules:

    ```bash
    sudo a2enmod rewrite proxy proxy_http remoteip ssl headers http2
    ```

3. Disable `deflate` module:

    ```bash
    sudo a2dismod -f deflate
    ```

4. Then copy the template file from `./ansible/roles/redirect_apache2/templates/vhost.conf.j2`, rename it `redirector.conf`, and copy it in `/etc/apache2/sites-enabled/`
5. Remove any other file in this directory
6. Replace `{{ vars }}` by your values in this file.
7. Harden the default apache2 conf by setting `ServerTokens Prod` and `ServerSignature Off` in `/etc/apache2/conf-enabled/security.conf`

### Launch

If `apache2` was installed using the package manager, a service is keeping it running. So you can reload it:

```bash
systemctl reload apache2.service
```

## Comments

- The given configuration file is only redirecting everything to the C2, without any filtering. Some tweaking is needed to make this method "smart".

## Resources

- [Automatically Generate Rulesets for Apache mod_rewrite or Nginx for Intelligent HTTP C2 Redirection](https://github.com/threatexpress/cs2modrewrite)
