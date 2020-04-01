# redirect-lib

Library of traffic redirectors.

This project aim to gather methods to redirect traffic (HTTP/S, DNS) to another server. This capability is usefull to hide a server IP and bring flexibility. If the redirector is identified and blocked by defenders, a new one can be setup more easily than a full C&C server.

Each documented redirection method is in a dedicated directory.

## Categories

Redirectors has following attributes:

| Attribute      | Description                                                                                       | Possible values                                                        |
| -------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Type           | Is it a smart or dumb redirector ? Is it able to apply conditionnal filtering/redirection rules ? | `smart`, `dumb`                                                        |
| Subtype        | Give more details on the redirector                                                               | `command line`, `web server`, `function`, `service to configure`, etc. |
| Automated      | Is the deployement process automated ?                                                            | `yes`, `no`                                                            |
| Keep Origin IP | Does the redirecter keep in any way the client IP and is able to tranfer it to the C2 ?           | `yes`, `no`                                                            |
| Decrypt        | Does the redirector needs to decrypt the trafic and thus exposing data to the provider ?          | `yes`, `no`                                                            |

## Automation

Automated solution make use of `terraform` and `ansible` when needed and possible.

Ansible config suppose you use `root` or a user able to become `root`.

### Terraform

To deploy a redirector, `cd` in the `terraform` directory corresponding to the desire method and then:

```bash
terraform init
cp templates.tfvars my_redirector.tfvars

# Edit my_redirector.tfvars

terraform apply --var-file my_redirector.tfvars
```

Automation is done (when it is) to host the redirector on **AWS** (for redirector type such as `web server` or `command line`).

## 💰 Pricing 💰

One of the goal of this project is to find cheap solutions. Feel free to propose any improvment to reduce the cost of a solution. Average cost of solutions are around 5$/month. Nonetheless, as price may vary no cost estimation is done per solution.

:warning: Be carefull with solution with a "pay per request" pricing. As you may use your redirector heavily at some point (ex. Cobalt Strike in interactive mode), cost can rise rapidly.

Tips : Doing 4 requests per second, during a month will result in 10 368 000 request per month.

If you don't need much, you may even stay under the "Free Tier" or "developper" offers threshold and not pay anything.

## Comments

Some global recommendations/comments:

- As you may notice, cloud instance choosen in automation are the smallest ones. You only need to redirect HTTP/S requests. If you find cheapest/smallest solutions, feel free to open an issue.

## Ideas

Here is the following ideas/candidates I have not yet explore:

- Netlify CDN

## Resources

[HTTPS Payload and C2 Redirectors](https://posts.specterops.io/https-payload-and-c2-redirectors-ff8eb6f87742)
