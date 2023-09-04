## Caddy Bufferbloat Experimentation

## Installing Caddy

### Building caddy From Source

1. Install xcaddy

```console
$ go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
```

2. Build the latest

```console
$ xcaddy build latest
```

## Installing RPM Server (Go implementation)

TODO

## Experiments

### Experiment 1: Basic configuration

Use the Caddyfile named `Caddyfile-basic`:

```json
```

Start the RPM server.

```console
$ ./networkqualityd --create-cert --public-name <IP> --config-name <IP> --config-name <IP> --listen-addr 0.0.0.0 -debug
```

Confirm that the proxy is working:

```console
$ curl --http2 -k https://10.63.1.35/config 
{
    "version": 1,
    "urls": {
        "small_download_url": "https://10.63.1.35:4043/small",
        "large_download_url": "https://10.63.1.35:4043/large",
        "upload_url": "https://10.63.1.35:4043/slurp",
        "small_https_download_url": "https://10.63.1.35:4043/small",
        "large_https_download_url": "https://10.63.1.35:4043/large",
        "https_upload_url": "https://10.63.1.35:4043/slurp"
    }
}
```

> Note: Make sure that the port number in the config is pointing to the proper spot. In the non-Caddy configuration, it should point to the 4043 port. For the Caddy configuration, it should point to the 443 port.

