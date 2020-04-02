# Traefik

| Type    | Subtype      | Automated | Keep Origin IP                 | Decrypt |
| ------- | ------------ | --------- | ------------------------------ | ------- |
| `smart` | `web server` | `yes`     | `yes`  (if proxyprotocol used) | `no`    |

## How to

### Install

1. Follow instructions from the [official doc](https://docs.traefik.io/getting-started/install-traefik/).
2. Copy the template file in `./ansible/roles/redirect_traefik/templates/traefik.toml.j2` and rename it `traefik.toml`
3. Replace `{{ vars }}` by your values

### Launch

Launch the binary downloaded

```bash
./traefik --configfile traefik.toml
```

## Comments

- As you can see from the official doc, traefik is primarly a solution for containerized applications. Thus useing it in a docker may be an easier/stronger solution.

## Resources

- [Traefik ProxyProtocol](https://docs.traefik.io/routing/entrypoints/#proxyprotocol)
