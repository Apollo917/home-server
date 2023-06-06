# Installing Operating System

For the home server, I decided to use **Ubuntu Server 22.04** as it is a reliable, maintainable OS with a big community.

👀 Check out [Resources](#resources) section for more info and guides

## Setting up

### 1. Downloading OS ISO image

- [Ubuntu Server 22.04 ISO image](https://ubuntu.com/download/server).

### 2. Creating a bootable USB stick

Here are a few possible options to create a bootable USB stick with an ISO image.<br>
I've used the first one.

- [balenaEtcher](https://ubuntu.com/tutorials/install-ubuntu-desktop#3-create-a-bootable-usb-stick)
- [Rufus](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)

### 3. First steps after successful installation

- upgrading packages
  - [How to Upgrade Packages on Ubuntu via Command Line](https://tecadmin.net/upgrading-ubuntu-packages-command-line/)
- cloud-init disabling (optional)
  - cloud-init could be disabled by executing the following CLI command: `sudo touch /etc/cloud/cloud-init.disabled`

**Note**

**✎** Right now, I am not using cloud-init. It slightly slowed down system startup in my case, so I decided to turn it off for now.

➡️ [**The next step: Router configuration**](./router-configuration.md)

## Resources

### Downloads

- [Ubuntu Server 22.04 ISO image](https://ubuntu.com/download/server)

### Docs & articles

- [Bootable USB stick creation with balenaEtcher](https://ubuntu.com/tutorials/install-ubuntu-desktop#3-create-a-bootable-usb-stick)
- [Bootable USB stick creation with Rufus](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)
- [How to Upgrade Packages on Ubuntu via Command Line](https://tecadmin.net/upgrading-ubuntu-packages-command-line/)
