ISO=debian-2.0r0-i386-binary-1.iso

all: run

$(ISO):
	wget http://mirror.debianforum.de/debian-iso-archive/hamm/i386/debian-2.0r0-i386-binary-1.iso

run: clean-containers $(ISO)
	echo "Serving VNC at $$(boot2docker ip):5900 ..."
	docker run --rm --privileged -it -v $$(pwd):/mnt -e QEMU_CDROM=/mnt/$(ISO) -p 5900:5900 -p 22:2222 $(IMAGE)

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-images clean-layers
