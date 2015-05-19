IMAGE=mcandre/docker-debian:2.2
ROOTFS=rootfs.tar.gz
define GENERATE
export DEBIAN_FRONTEND=noninteractive && \
apt-get update && \
apt-get install -y debootstrap && \
mkdir /chroot && \
debootstrap --arch i386 potato /chroot http://archive.debian.org/debian && \
cd /chroot && \
cp /mnt/sources.list etc/apt/sources.list && \
tar czvf /mnt/rootfs.tar.gz .
endef

all: run

$(ROOTFS):
	docker run --rm --privileged -v $$(pwd):/mnt mcandre/docker-debian:woody sh -c '$(GENERATE)'

build: Dockerfile $(ROOTFS)
	docker build -t $(IMAGE) .

run: clean-containers build
	docker run --rm $(IMAGE) sh -c 'cat /etc/*version* && apt-get update | head -n 1'

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean-rootfs:
	-rm $(ROOTFS)

clean: clean-containers clean-images clean-layers clean-rootfs

publish:
	docker push $(IMAGE)
