# Traefik

- [Traefik](https://traefik.io/)
- [Traefik docs](https://doc.traefik.io/traefik/)

> Traefik is an open-source Edge Router that makes publishing your services a fun and easy experience. It receives requests on behalf of your system and finds out which components are responsible for handling them

**Traefik** is a reverse proxy. It gives a lot of possibilities with help of using the middleware. Hence, you are able, for example, to integrate two-factor authentication (e.g. [Authelia](https://www.authelia.com/)) on all your services, which are reverse-proxied by Traefik. Also, with Traefik you can set up a secure way to communicate with your home server services via HTTPS protocol.

👀 Check out [Resources](#resources) section for more info and guides

## Service setup

Do you remember you created a Docker network named "**proxy**" on one of the previous steps?<br>
This network is required for Traefik to have the possibility to proxy incoming requests to services. Therefore, all services that must be "hidden" behind Traefik must be in the same network as him.

### Starting up Traefik with a Docker

**Configs:**

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./.env)
- [data/traefik.yml](./data/traefik.yml)
- [data/config.yml](./data/config.yml)
- [data/acme.json](./data/acme.json)

**Note**

**✎** Before starting up the Traefik container, you need to execute the following CLI command on your server for the **acme.json** file: `chmod 600 <insert_full_path_to_file>/acme.json`

**Guides:**

To setup Traefik, you could follow one of the tutorials below:

- [Put Wildcard Certificates and SSL on EVERYTHING - Traefik Tutorial](https://youtu.be/liV3c9m_OX8)
- [Is this the BEST Reverse Proxy for Docker? // Traefik Tutorial](https://youtu.be/wLrmmh1eI94)
- [How to Install and Setup Traefik with Cloudflare Using Your Own Domain](https://youtu.be/b83S_N1kkJM)
- [Traefik Portainer SSL](https://github.com/techno-tim/techno-tim.github.io/tree/master/reference_files/traefik-portainer-ssl/traefik)

### traefik.yml description

- [data - traefik.yml](./data/traefik.yml)

In the current setup were used static file configuration for Traefik.<br>
You can find more info about Traefik configuration types by the following link: [Configuration Introduction - The Static Configuration](https://doc.traefik.io/traefik/getting-started/configuration-overview/#the-static-configuration).

#### Entry points

There are defined two similar groups of endpoints.

The first one with a "**private-**" prefix only accepts requests from the local network.<br>
This behavior is achieved using **local-ips-whitelist** middleware, defined in the **config.yml** dynamic config file.<br>
Private entry points are listening to **80** and **443** TCP ports.

The second one with a "**public-**" prefix only accepts requests from the local and Cloudflare networks.<br>
This behavior is achieved using **local-ips-whitelist** and **cloudflare-ips-whitelist** middlewares, defined in the **config.yml** dynamic config file.<br>
Public entry points are listening to **8080** and **8443** TCP ports.

Remember, you have set up the router port forwarding in one of the previous steps: [The basis for accessing the home server from the Internet](../../setup-guide/router-configuration.md#the-basis-for-accessing-the-home-server-from-the-internet)?<br>
The purpose of that config was to set up Internet requests forwarding from Cloudflare to your home server.<br>
But why router port forwarding config forward requests only to the **8443** port?<br>
It is because **Cloudflare** automatically redirects all **HTTP** requests to **HTTPS** endpoints to enforce security. So there is no reason to open an extra public port that may accept an unsecured connection.

Also, you can see that both private and public **HTTP** entry points are using redirections to **HTTPS**. There is a similar to Cloudflare's logic behind it.

#### Certificates resolvers

Cloudflare certificate resolver is used to get valid and up-to-date SSL certificates. So you could access your home server services with your domain name by HTTPS protocol within your local network.

**Note**

**✎** You can get **valid**, **non-self-signed** SSL certificates only if you use a domain name **you own**. In the current setup, used purchased on [GoDaddy](https://www.godaddy.com/uk-ua) domain name. Of course, you can use another domain vendor, for example, Cloudflare. Just make sure that it supports domain transfer to Cloudflare.

#### Summary

As a result, you have two separate, protected by IP filtering entry point groups, which allow you to restrict access to your private home server services and enable access to public services from the Internet at the same time.

### config.yml description

- [data - config.yml](./data/config.yml)

You can find more info about Traefik dynamic file configuration by the following link: [Configuration Discovery - File](https://doc.traefik.io/traefik/providers/file/)

In the current setup, dynamic file configuration was used only for defining middleware for public and private entry points.<br>
Services integration configuration is performed via **Docker labels**.

### acme.json description

- [data - acme.json](./data/acme.json)

**acme.json** file is used to persist your SSL certificates.

➡️ [**The next step: Cloudflare**](../../setup-guide/cloudflare.md)

## Resources

### YouTube

- [Put Wildcard Certificates and SSL on EVERYTHING - Traefik Tutorial](https://youtu.be/liV3c9m_OX8)
- [Is this the BEST Reverse Proxy for Docker? // Traefik Tutorial](https://youtu.be/wLrmmh1eI94)
- [How to Install and Setup Traefik with Cloudflare Using Your Own Domain](https://youtu.be/b83S_N1kkJM)

### Docs & articles

- [Traefik](https://traefik.io/)
- [Traefik docs](https://doc.traefik.io/traefik/)
- [Traefik Portainer SSL](https://github.com/techno-tim/techno-tim.github.io/tree/master/reference_files/traefik-portainer-ssl/traefik)
- [Configuration Introduction - The Static Configuration](https://doc.traefik.io/traefik/getting-started/configuration-overview/#the-static-configuration)
- [Configuration Discovery - File](https://doc.traefik.io/traefik/providers/file/)

### Configs

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./traefik.env)
- [data/traefik.yml](./data/traefik.yml)
- [data/config.yml](./data/config.yml)
- [data/acme.json](./data/acme.json)
