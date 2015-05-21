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
Welcome to Debian GNU/Linux 1.3!
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)
* [jigdo](http://atterer.org/jigdo/)

## Optional

* a VNC viewer
* [make](http://www.gnu.org/software/make/)

## Debian/Ubuntu

```
$ sudo apt-get install docker.io jigdo-file vino build-essential
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io jigdo-file vino
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
$ brew install boot2docker jigdo
```

### Windows

* [Chocolatey](https://chocolatey.org/)
* [TightVNC](http://www.tightvnc.com/)
* [jigdo for Windows](http://atterer.org/sites/atterer/files/2009-08/jigdo/jigdo-win-0.7.2.zip)

```
> chocolatey install docker tightvnc make
```
