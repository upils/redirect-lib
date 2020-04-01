# Socat

| Type   | Subtype        | Automated | Keep Origin IP | Decrypt |
| ------ | -------------- | --------- | -------------- | ------- |
| `dumb` | `command line` | `no`      | `no`           | `no`    |

## How to

### Install

```bash
sudo apt install socat
```

### Launch

Launch the following command in a `screen`/`tmux` session (launch a second one on port TCP/80 if you also wnat HTTP traffic):

```bash
sudo socat TCP4-LISTEN:443,fork TCP4:<C2_IP>:443
```

To make it persistent (survive reboot), you can add a cron job:

```bash
cron -e
@reboot socat TCP4-LISTEN:443,fork TCP4:<C2_IP>:443 &
```

## Comments

- There is no daemon mode builtin, thus the need of a `screen`/`tmux`
- :warning: It can getting slow with time or large amounts of traffic

## Resources

Red Team - Development and operations, by Joe Vest & James Tubberville
