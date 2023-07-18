# Portainer

- [Portainer](https://www.portainer.io/)
- [Portainer docs](https://docs.portainer.io/)

> Portainer is a powerful container management service.<br>
> Portainer hides the complexity of managing containers behind an easy-to-use UI. By removing the need to use the CLI, write YAML or understand manifests, Portainer makes deploying apps and troubleshooting problems so easy that anyone can do it.

**Portainer** is one of the core services in the current home server setup. It is a service from which we want to start and configure all other services.<br>
But it is still optional.<br>
You can still handle all your Docker containers with a Docker CLI, but it may not be so handy.

👀 Check out [Resources](#resources) section for more info and guides.

## Service setup

### Getting a licence for a Portainer Business Edition

It makes sense to start right with Business Edition (BE).<br>
Yes, we probably need a license for it, but there is good news, we can get it for free straight from Portainer by following the link below!

- [Free Business Edition licence](https://www.portainer.io/take-5)

This free license applies to clusters, including up to 5 nodes, which makes it perfectly suitable for home setups.

### Starting up Portainer with a Docker

Until Traefik and Pi-hole setup, it is better to keep port 9443 accessible from outside of the container's network, so you can access Portainer UI and start up Traefik and Pi-hole services through it.

**Configs:**

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./service.env)

**Guides:**

- [Portainer Install Ubuntu tutorial - manage your docker containers](https://youtu.be/ljDI5jykjE8)
- [Install Portainer BE with Docker on Linux](https://docs.portainer.io/start/install/server/docker/linux)
- [Deploying Portainer behind Traefik Proxy](https://docs.portainer.io/advanced/reverse-proxy/traefik)

➡️ [**The next step: BIND 9**](../bind9/README.md)

## Resources

### YouTube

- [Portainer Install Ubuntu tutorial - manage your docker containers](https://youtu.be/ljDI5jykjE8)

### Docs & articles

- [Portainer](https://www.portainer.io/)
- [Portainer docs](https://docs.portainer.io/)
- [Install Portainer BE with Docker on Linux](https://docs.portainer.io/start/install/server/docker/linux)
- [Deploying Portainer behind Traefik Proxy](https://docs.portainer.io/advanced/reverse-proxy/traefik)
- [Free Business Edition licence](https://www.portainer.io/take-5)

### Configs

- [Docker compose file](./docker-compose.yml)
- [env file with required and optional environment variables](./service.env)
