# redirect-lib

Library of traffic redirectors.

This project aim to gather methods to redirect traffic (HTTP/S, DNS) to another server. This capability is usefull to hide a server IP and bring flexibility. If the redirector is identified and block by defenders, a new one can be setup more easily than a full C&C server.

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

## Ideas

- Netlify CDN

## Resources

[HTTPS Payload and C2 Redirectors](https://posts.specterops.io/https-payload-and-c2-redirectors-ff8eb6f87742)