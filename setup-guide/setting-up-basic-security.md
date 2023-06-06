# Setting up basic security

In this step, you will configure essential security by configuring standard tools, which come right out of the box.

⚠️**IMPORTANT**⚠️

**This is really a basic security setup!**

👀 Check out [Resources](#resources) section for more info and guides

## Setting up

### 1. SSH keys setup

- [How to Set Up SSH Keys](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-22-04)

### 2. Creating Windows/Linux SSH config file

- [How to Manage an SSH Config File in Windows and Linux](https://www.howtogeek.com/devops/how-to-manage-an-ssh-config-file-in-windows-linux/)

### 3. Disable SSH root and password login

- [How to disable ssh password login on Linux to increase security](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)
- [How To Disable Root Login](https://www.digitalocean.com/community/tutorials/how-to-disable-root-login-on-ubuntu-20-04)

**Note**

**✎** `/etc/ssh/sshd_config` lets you change an SSH port by uncommenting and tuning the `Port` property

**✎** `/etc/ssh/sshd_config.d/50-cloud-init.conf` file may override properties from `/etc/ssh/sshd_config`, so it is better to check it also and comment out all required properties

### 4. Firewall config

- [How To Set Up a Firewall with UFW](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-22-04)

**Note**

**✎** **Docker** containers mapped ports bypass **UFW** firewall rules. It means that such ports are **accessible** even if they are not allowed by UFW rules.

➡️ [**The next step: Installing Docker**](./installing-docker.md)

## Resources

### Docs & articles

- [How to Set Up SSH Keys](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-22-04)
- [How to Manage an SSH Config File in Windows and Linux](https://www.howtogeek.com/devops/how-to-manage-an-ssh-config-file-in-windows-linux/)
- [How to disable ssh password login on Linux to increase security](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)
- [How To Disable Root Login](https://www.digitalocean.com/community/tutorials/how-to-disable-root-login-on-ubuntu-20-04)
- [How To Set Up a Firewall with UFW](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-22-04)
