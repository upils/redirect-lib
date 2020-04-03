# CloudFlare - Workers

| Type    | Subtype    | Automated | Keep Origin IP                    | Decrypt |
| ------- | ---------- | --------- | --------------------------------- | ------- |
| `smart` | `function` | `yes`     | `yes` (with X-Forwarded-For used) | `yes`   |

## How to

- Connect to [dash.cloudflare.com](https://dash.cloudflare.com)
- Create a new worker
- Copy the conf from `./terraform/script.tpl` and replace `c2_ip` and `c2_port` values

## Comments

- As I have not a paid CloudFlare plan, I am not able to fully test the automation.
- [To get your Zone ID](https://developers.cloudflare.com/workers/quickstart/#configure)

## Resources

- [Red-Baron](https://github.com/WheelsVT/Red-Baron/tree/master/modules/cloudflare)
