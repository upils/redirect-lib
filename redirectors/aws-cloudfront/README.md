# AWS Cloudfront

| Type   | Subtype | Automated | Keep Origin IP | Decrypt |
| ------ | ------- | --------- | -------------- | ------- |
| `dumb` | `CDN`   | `yes`     | `no`           | `yes`   |

## How to

1. Go to [https://console.aws.amazon.com/cloudfront/home](https://console.aws.amazon.com/cloudfront/home)
2. Create a web distribution
   1. Choose a name fitting your scenario or a random one, but NOT a name telling explicitly this a redirector as the name will be used as a sub-domain.
   2. For `Origin Protocol Policy` choose `Match Viewer` We do not want to receive a connection aiming our HTTP listenner, to our HTTP**S** listenner.
   3. For `Allowed HTTP Methods` choose the third option if you intend to use other HTTP verb than GET/HEAD.
   4. For `Price Class` you can you can restrict the location to reduce even further the cost of the solution.

## Comments

N/A

## Resources

N/A
