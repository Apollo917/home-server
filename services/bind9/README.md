# BIND 9

- [BIND 9](https://www.isc.org/bind/)
- [BIND 9 Docs](https://downloads.isc.org/isc/bind9/9.18.16/doc/arm/html/)

BIND 9 - versatile, classic, complete name server software.<br>
BIND 9 has evolved to be a very flexible, full-featured DNS system. Whatever your application is, BIND 9 probably has the required features

## Service setup

**Configs:**

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./service.env)
- [named.conf](./data/config/named.conf)
- [example.com](./data/config/example.com)
- [example.com.rev](./data/config/example.com.rev)

**Guides:**

- [You want a real DNS Server at home? (bind9 + docker)](https://youtu.be/syzwLwE3Xq4)
- [How to Install and Configure a Private BIND DNS Server on Ubuntu 22.04?](https://www.cherryservers.com/blog/how-to-install-and-configure-a-private-bind-dns-server-on-ubuntu-22-04)

### named.conf

Lets take a look at named.conf config file structure.

#### ACL (Access Control List)

The ACL section defines an access control list named "**LAN**" that specifies which IP addresses or networks are allowed to query this DNS server. In this case, the following entities are allowed:

- The IP addresses in the range 192.168.0.0 to 192.168.0.255 (192.168.0.0/24 subnet) - they may be different in your case
- The IP addresses in the range 172.18.0.0 to 172.18.255.255 (172.18.0.0/16 subnet) - they may be different in your case
- The local machine itself (localhost)
- The local network (localnets)

**Options**

The options section configures various global options for the BIND server. In this case, two important options are set:

- allow-query: This option specifies who is allowed to make DNS queries to this server. It is set to "LAN," which refers to the ACL defined earlier. Therefore, only clients from the IP addresses or networks listed in the "LAN" ACL are allowed to make queries.
- forwarders: This option specifies the IP addresses of external DNS servers that will be used for forwarding queries that the local DNS server cannot resolve itself. The provided IP addresses (1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4) are popular public DNS servers offered by Cloudflare and Google.

**Zone "example.com"**

This section defines a DNS zone for the domain "**example.com**". It specifies that this DNS server is the master for the zone and the zone data file is located at `/etc/bind/example.com`. This means that this BIND server is authoritative for the "**example.com**" domain and will serve DNS records for it.

**Zone "0.168.192.in-addr.arpa"**

This section defines a reverse DNS zone for the IP addresses in the range 192.168.0.0/24. It specifies that this DNS server is the master for the reverse zone and the zone data file is located at "`/etc/bind/example.com.rev`". Reverse DNS is used to map IP addresses to domain names, and this zone is used to resolve reverse lookups for IP addresses within the specified range.

Overall, this BIND 9 configuration allows clients from the **LAN** network (specified in the "**LAN**" ACL) to query the DNS server. If the DNS server can't resolve a query itself, it will forward the request to the specified external DNS servers. The configuration also sets up the DNS server as authoritative for the "**example.com**" domain and provides a reverse DNS zone for the IP addresses in the 192.168.0.0/24 subnet.

### example.com

UNDER CONSTRUCTION

### example.com.rev

UNDER CONSTRUCTION

## Resources

### YouTube

- [You want a real DNS Server at home? (bind9 + docker)](https://youtu.be/syzwLwE3Xq4)

### Docs & articles

- [BIND 9](https://www.isc.org/bind/)
- [BIND 9 Docs](https://downloads.isc.org/isc/bind9/9.18.16/doc/arm/html/)
- [BIND 9 Docker](https://hub.docker.com/r/ubuntu/bind9)
- [How to Install and Configure a Private BIND DNS Server on Ubuntu 22.04?](https://www.cherryservers.com/blog/how-to-install-and-configure-a-private-bind-dns-server-on-ubuntu-22-04)

### Configs

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./service.env)
- [named.conf](./data/config/named.conf)
- [example.com](./data/config/example.com)
- [example.com.rev](./data/config/example.com.rev)
