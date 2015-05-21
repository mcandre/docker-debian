ISO=debian-bo/iso/Debian-1.3.1-bo-binary.iso

all: run

$(ISO):
	sh -c 'cd debian-bo/ && jigdo-file make-image --jigdo=iso/Debian-1.3.1-bo-binary.iso.jigdo *'

run: clean-containers $(ISO)
	echo "Serving VNC at $$(boot2docker ip):5900 ..."
	docker run --rm --privileged -it -v $$(pwd):/mnt -e QEMU_CDROM=/mnt/$(ISO) -p 5900:5900 -p 2222:22 tianon/qemu

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-layers
