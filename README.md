# Home server setup basics

Hi! 🙂 Let me introduce to you a short story behind this repo 🙃

Quite a bit ago, I remembered that somewhere was laying my old PC without any purpose, just covering with dust. And I decided to turn this forgotten bunch of dusty micro schemas into my home server.<br>
Why?<br>
Because it's fun, we can discover and learn new stuff in practice. Last but not least, there are many different kinds of open-source services that could be run on a home server and improve your work, leisure, you name it.

**In short**, this repo reflects my home server setup journey. It contains:

- guides, documentation, and other materials that I found helpful during the system and services setup process
- description of pitfalls and problems that I faced and their solutions
- [ready-to-use service configs](./services/README.md)
- [resources](#resources) that you may find interesting and useful
- [step-by-step home server "base" setup guide](./setup-guide/README.md)

I hope this repo will be helpful and facilitate your introduction to the self-hosting world.<br>
Have fun, and check out the [resources](#resources) and [services](./services/README.md) section!

And, of course, a big shoutout to the open-source community and tech content creators.<br>
You are making and helping to make inspiring things. Thank you!

⚠️**DISCLAIMER**⚠️

**It is not an ultimate guide!**

Some aspects may be missed, or there could be more proper approaches to do things.<br>
So please, be careful and get familiar with the service's official documentation when you get comfortable.

## Table of contents

- [Services](./services/README.md)
- [Chosen approach to home server setup](#chosen-approach-to-home-server-setup)
- [Step-by-step home server "base" setup guide](./setup-guide/README.md)
- [Repository structure](#repository-structure)
- [Resources](#resources)

## Chosen approach to home server setup

Combining three local services (**Bind9**, **Traefik**, **Portainer**) and **Cloudflare** is a basis for the current home server setup. Here is a brief description of such services:

[**Bind9**](./services/bind9/README.md) - is an open-source DNS server. It shows itself as really reliable solution for my home server.

[**Traefik**](./services/traefik/README.md) - is an open-source Edge Router that makes publishing your services a fun and easy experience. It receives requests on behalf of your system and finds out which components are responsible for handling them.

[**Portainer**](./services/portainer/README.md) - is a powerful container management service that hides the complexity of managing containers behind an easy-to-use UI.

[**Cloudflare**](https://www.cloudflare.com/) - is a global network designed to make everything you connect to the Internet secure, private, fast, and reliable.

Services start-up approach: run every service in a [Docker](https://www.docker.com/) container if possible, and service documentation doesn't say otherwise.

All services that need to be accessible from the local network or Internet are reverse proxied via Traefik. It's done with the help of docker labels. Every docker-compose file contains a Traefik integration docker labels section. So if you want to turn it off or use another solution like [Nginx Proxy Manager](https://nginxproxymanager.com/), comment out or remove Traefik docker labels. But remember to map service UI ports, etc., while your reverse proxy isn't active, so you can access your services outside the container's network.

Okay, after introducing core services briefly, it's time for action!<br>
Let's jump to [step-by-step home server "base" setup guide](./setup-guide/README.md), where you will learn more about core services and their setup process.

## Repository structure

```
...
📁services/
├─ 📁service-name/
│  ├─ 📁data/
│  ├─ 📁materials/
│  ├─ 📄 docker-compose.yml
│  ├─ 📄 service.env
│  ├─ 📄 README.md
...
```

Every service in the current repo comes with the following:

- **README.md** - contains concise service info, guides, notes, possible problems & their solutions, etc.
- **materials** - materials for service description: media, img, etc.
- **docker-compose.yml** - ready to deploy docker-compose file
- **service.env** - declaration of required and optional env variables for the current use case.<br>It may not contain all possible service env vars, so please take a look at official service docs for a complete env vars list
- **data** - root directory for files/directories that need to be mounted into the container

## Resources

### YouTube

- [Techno Tim](https://www.youtube.com/@TechnoTim)
- [Christian Lempa](https://www.youtube.com/@christianlempa)
- [NetworkChuck](https://www.youtube.com/@NetworkChuck)
- [VirtualizationHowto](https://www.youtube.com/@VirtualizationHowto)
- [DB Tech](https://www.youtube.com/@DBTechYT)
- [Jeff Geerling](https://www.youtube.com/@JeffGeerling)
- [OneMarcFifty](https://www.youtube.com/@OneMarcFifty)
- [Wolfgang's Channel](https://www.youtube.com/@WolfgangsChannel)

### Community

- [Discord - Techno Tim](https://l.technotim.live/discord)
- [Discord - Christian Lempa](https://discord.com/invite/christian-lempa-s-tech-community-702179729767268433)

### Repos

- [Awesome-Selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted)
- [Dashboard Icons](https://github.com/walkxcode/dashboard-icons)

### Utils

- [VS Code | Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
