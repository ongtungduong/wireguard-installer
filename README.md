# Wireguard installer for Ubuntu servers

**This project is a bash script that aims to setup Wireguard on Ubuntu servers, as easily as possible!**

- Make sure that your kernel supports WireGuard (all modern kernels).

## Usage

### Wireguard UI

- Make sure that you have installed Docker. If not, you can follow this [repository](https://github.com/ongtungduong/docker-installer).

To install Wireguard UI, run the following command and answer the questions asked by the script.

```bash
bash <(curl -sSL https://github.com/ongtungduong/wireguard-installer/raw/main/wireguard-ui.sh)
```

### Wireguard CLI

To get Wireguard CLI, run the following command.

```bash
sudo curl -sSL https://github.com/ongtungduong/wireguard-installer/raw/main/wireguard-cli.sh > /usr/local/bin/wgcli
sudo chmod +x /usr/local/bin/wgcli
```
