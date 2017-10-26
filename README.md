# just-djbdns

This is a docker image to run a djbdns server for publishing public DNS records on the internet. 

*If you're looking to run a local network DNS cache server search for "DNS cache" on https://hub.docker.com*

#### Notes:

* The `tinydns` service directory is `/srv/dns`
* You (probably) want to mount your data file from your host to `/srv/dns/root/data`
* `make` is run when the container starts (this rebuilds the DNS entry index)
* After updating your data file on the root filesystem, execute `/rebuild.sh` on the container to make the changes take effect:
`docker exec [ CONTAINER NAME OR ID ] /rebuild.sh`

### Basic Usage:

```docker run -v `pwd`/test.dns:/srv/dns/root/data -p 53:53/tcp -p 53:53/udp xcsrz/just-djbdns```

### Docker Compose:

```
version: "3"
services:
  dns:
    image: xcsrz/just-djbdns
    volumes:
      - ./dns.data:/srv/dns/root/data
    ports:
      - 53:53/tcp
      - 53:53/udp
```

### References

[Data File Format](http://cr.yp.to/djbdns/tinydns-data.html)

[All About djbdns](http://cr.yp.to/djbdns.html)