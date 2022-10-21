
TAG := "fedora-37-headless-mutter"

all: build create start attach

run: start attach

build:
	podman build -t $(TAG) .

create:
	podman container exists $(TAG) || podman create --name $(TAG) -it $(TAG)

start:
	podman start $(TAG)

attach:
	podman attach $(TAG)

clean:
	podman rm $(TAG)


