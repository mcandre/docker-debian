# docker-debian - Docker base images for Debian

# ABOUT

docker-debian is a collection of [debootstrap](https://wiki.debian.org/Debootstrap)-generated Debian base images.

## 2.0-

mcandre/docker-debian:2.0 and below offer [qemu](https://registry.hub.docker.com/u/tianon/qemu/) emulation for ancient Debian versions.

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-debian/

# EXAMPLE

```
$ make
...
Serving VNC at localhost:5900 ...
Welcome to Debian GNU/Linux 2.0!
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)

## Optional

* a VNC viewer
* [make](http://www.gnu.org/software/make/)

## Debian/Ubuntu

```
$ sudo apt-get install docker.io vino build-essential
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io vino
```

## non-Linux

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [boot2docker](http://boot2docker.io/)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)
* [TigerVNC](http://tigervnc.org/)

```
$ brew cask install virtualbox vagrant tigervnc
$ brew install boot2docker
```

### Windows

* [Chocolatey](https://chocolatey.org/)
* [TightVNC](http://www.tightvnc.com/)

```
> chocolatey install docker tightvnc make
```
