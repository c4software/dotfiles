# Raspberry Pi rtl-sdr server setup

Quick guide to setup a RTL SDR Server on a Raspberry Pi.


## Base

- Raspbian-litie (https://downloads.raspberrypi.org/raspbian_lite_latest)
- Rpi (2 or 3)

## Flash the Sdcard

```sh
$ sudo dd bs=1m if=path_of_your_image.img of=/dev/rdiskn conv=sync
```

## Base Setup

```sh
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo rpi-update
```

## Install rtl-sdr software

In 2018 no need to compile rtl-sdr package, everything is already available in repo.

```sh
$ sudo apt-get install rtl-sdr
```

Done ! Everything is installed. You can test your setup with :

```sh
$ rtl_tcp
```

## Service & Auto-startup

With systemd the process to create a startup service is a little different than previous version.

```sh
sudo nano /etc/systemd/system/rtlsdr.service
```

Paste the following content :


