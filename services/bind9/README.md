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

**Note**

**✎** When you will try to run your BIND9 docker container, you'll probably face error. It is because that the port **53** is already in use.<br>
But there is a simple way to fix it:

- open `/etc/systemd/resolved.conf` file **with root privileges** in any text editor, e.g. `sudo nano /etc/systemd/resolved.conf`
- find and uncomment (remove **#** in front of) the **DNSStubListener** property
- set its value to **no** save and close the file
- restart systemd-resolved service by the following command: `sudo systemctl restart systemd-resolved`

And now lets take a look at the configuration files and their structure.<br>
Note, that in your case IP addresses and subnets may differ. Also I've used **example.com** domain name for demo purpose, please replace it with your domain name.

### named.conf

The **named.conf** file is the central configuration file for BIND 9 that defines how the DNS server operates. It provides control over global settings, zone configurations, access control, logging, and other aspects of the DNS server's behavior. Properly configuring the **named.conf** file is crucial to ensure the server functions correctly, efficiently, and securely.

#### ACL (Access Control List)

The ACL section defines an access control list named "**LAN**" that specifies which IP addresses or networks are allowed to query this DNS server. In this case, the following entities are allowed:

- The IP addresses in the range 192.168.0.0 to 192.168.0.255 (192.168.0.0/24 subnet)
- The IP addresses in the range 172.18.0.0 to 172.18.255.255 (172.18.0.0/16 subnet)
- The local machine itself (localhost)
- The local network (localnets)

#### Options

The options section configures various global options for the BIND server. In this case, two important options are set:

- allow-query: This option specifies who is allowed to make DNS queries to this server. It is set to "LAN," which refers to the ACL defined earlier. Therefore, only clients from the IP addresses or networks listed in the "LAN" ACL are allowed to make queries.
- forwarders: This option specifies the IP addresses of external DNS servers that will be used for forwarding queries that the local DNS server cannot resolve itself. The provided IP addresses (1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4) are popular public DNS servers offered by Cloudflare and Google.

#### Zone "example.com"

This section defines a DNS zone for the domain "**example.com**". It specifies that this DNS server is the master for the zone and the zone data file is located at `/etc/bind/example.com`. This means that this BIND server is authoritative for the "**example.com**" domain and will serve DNS records for it.

#### Zone "0.168.192.in-addr.arpa"

This section defines a reverse DNS zone for the IP addresses in the range 192.168.0.0/24. It specifies that this DNS server is the master for the reverse zone and the zone data file is located at "`/etc/bind/example.com.rev`". Reverse DNS is used to map IP addresses to domain names, and this zone is used to resolve reverse lookups for IP addresses within the specified range.

Overall, this BIND 9 configuration allows clients from the **LAN** network (specified in the "**LAN**" ACL) to query the DNS server. If the DNS server can't resolve a query itself, it will forward the request to the specified external DNS servers. The configuration also sets up the DNS server as authoritative for the "**example.com**" domain and provides a reverse DNS zone for the IP addresses in the 192.168.0.0/24 subnet.

### example.com

**example.com** config file maps the apex domain ("**example.com**") to the IP address 192.168.0.100. Additionally, it uses a wildcard record to map all unspecified subdomains to the same IP address.

#### $TTL 2d

This line sets the default Time to Live (TTL) value for the records in this zone to **2 days**. The TTL determines how long other DNS servers and clients should cache the records before checking for updates.

#### @ IN SOA example.com. admin.example.com.

This line starts the **Start of Authority (SOA)** record. It specifies the primary nameserver for the zone and the responsible email address. In this case, the primary nameserver is "**example.com**" and the email address is "**admin.example.com**".

The subsequent lines within the parentheses provide additional details:

- **2307171859** - Serial number. It is recommended to increment this value each time the zone file is changed to notify secondary DNS servers about updates.
- **12h** - Refresh time. Secondary DNS servers should refresh their zone data from the primary nameserver at least once within this time.
- **15m** - Retry time. If a secondary DNS server fails to refresh within the refresh time, it should retry after this interval.
- **3w** - Expiry time. If a secondary DNS server cannot refresh the zone within this time, it should stop answering queries for this zone.
- **2h** - Negative Cache TTL. It specifies how long negative responses (for non-existent records) should be cached by other DNS servers and clients.

#### @ IN NS example.com.

This line specifies that the nameserver for the zone is "**example.com.**".

#### @ IN A 192.168.0.100

This line sets the IPv4 address (A record) for the apex/naked domain ("**example.com**") to **192.168.0.100**. It maps the domain name to the specified IP address.

#### \* IN A 192.168.0.100

This line sets a wildcard record, denoted by "\*", which matches any subdomain that does not have a specific record defined. It maps all such subdomains to the IP address **192.168.0.100**.

### example.com.rev

**example.com.rev** zone file defines a PTR record that associates the IP address **192.168.0.100** with the domain name "**example.com**" in reverse.

#### $TTL 2d and @ IN SOA example.com. admin.example.com.

The same as in **example.com** zone config file

#### @ IN NS example.com.

This line specifies that the nameserver for the zone is "example.com.".

#### 100 IN PTR example.com.

This line defines a **pointer (PTR) record**, which maps an IP address to a domain name. It associates the IP address **192.168.0.100** with the domain name "**example.com**" in reverse. PTR records are used for reverse DNS lookups.

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
