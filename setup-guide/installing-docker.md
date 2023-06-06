# Installing Docker

- [Docker](https://www.docker.com)

Docker is where we want to run most services on a home server. Why? Because it is one of the most reliable, fastest, and cleanest ways to run all your stuff.

👀 Check out [Resources](#resources) section for more info and guides

## Setting up

### 1. Docker installation

- [How To Install and Use Docker on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04)

### 2. First preparations

Let's create a new network named **proxy** with the following CLI command: `docker network create -d bridge proxy`.

Within the network created above will live most of our services.

In the upcoming guides, you will find more information about why we need a **proxy** network.

➡️ [**The next step: Portainer**](../services/portainer/README.md)

## Resources

### Docs & articles

- [Docker](https://www.docker.com)
- [Docker docs](https://www.docker.com/get-started/)
- [How To Install and Use Docker on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04)
