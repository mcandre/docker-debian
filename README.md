# docker-debian - Docker base images for Debian

# ABOUT

docker-debian is a collection of [debootstrap](https://wiki.debian.org/Debootstrap)-generated Debian base images.

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-debian/

# EXAMPLE

```
$ make
docker run --rm --privileged -v $(pwd):/mnt -t debian:sid sh -c 'apt-get update && apt-get install -y debootstrap && mkdir /chroot && debootstrap stretch /chroot && cd /chroot && tar czvf /mnt/rootfs.tar.gz .'
...

docker build -t mcandre/docker-debian:9 .
Step 0 : FROM scratch
Step 1 : MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>
Step 2 : ADD rootfs.tar.gz /
Successfully built f7b600b188c7

docker run --rm mcandre/docker-debian:9 sh -c 'cat /etc/*release*'
PRETTY_NAME="Debian GNU/Linux stretch/sid"
NAME="Debian GNU/Linux"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support/"
BUG_REPORT_URL="https://bugs.debian.org/"
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)

## Optional

* [make](http://www.gnu.org/software/make/)

## Debian/Ubuntu

```
$ sudo apt-get install docker.io build-essential
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io
```

## non-Linux

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [boot2docker](http://boot2docker.io/)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)

```
$ brew cask install virtualbox vagrant
$ brew install boot2docker
```

### Windows

* [Chocolatey](https://chocolatey.org/)

```
> chocolatey install docker make
```
