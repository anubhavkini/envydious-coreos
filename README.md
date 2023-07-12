# Envydious CoreOS
Configuration files for [Fedora CoreOS](https://fedoraproject.org/coreos/) server.

## Requirements
- [Butane](https://coreos.github.io/butane/)
- [Ignition](https://coreos.github.io/ignition/)
- [CoreOS Installer](https://coreos.github.io/coreos-installer/)
- Make

## Usage
### Build
Generate `envydious.ign`.
```shell
make envydious.ign
```
### Install
Install CoreOS with remote ignition file.
```shell
IGN_URL=https://github.com/anubhavkini/envydious-coreos/releases/latest/download/envydious.ign
sudo coreos-installer install --ignition-url $IGN_URL /dev/sda
```