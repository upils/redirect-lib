# Azure CDN

| Type   | Subtype | Automated | Keep Origin IP | Decrypt |
| ------ | ------- | --------- | -------------- | ------- |
| `dumb` | `CDN`   | `yes`     | `no`           | `yes`   |

## How to

On Azure Portal:

1. If needed, register `Microsoft.Cdn` on your subscription, see [the official doc](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/error-register-resource-provider#solution-3---azure-portal)
2. Create a CDN profile as described [here](https://docs.microsoft.com/fr-fr/azure/cdn/cdn-create-new-endpoint)
3. Create an endpoint on this profile
   1. Choose a name fitting your scenario or a random one, but NOT a name telling explicitly this a redirector as the name will be used as a sub-domain.
   2. Choose `Custom origin` as `Origin type`
   3. Set the domain of your C2 as `Origin hostname`

## Comments

- You need to install the Azure CLI (see [the official doc](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest))
- For automation, follow [this doc](https://www.terraform.io/docs/providers/azurerm/guides/azure_cli.html#logging-into-the-azure-cli) to get needed authentication information

## Resources

N/A
