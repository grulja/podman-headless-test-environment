DBUS_SOCKET_PATH ?= "/tmp/bus"
TAG := "fedora-37-portals"

all: build create start attach

run: start attach

build:
	mkdir -p $(DBUS_SOCKET_PATH)
	podman build -t $(TAG) --build-arg DBUS_SOCKET_PATH=$(DBUS_SOCKET_PATH) .

create:
	podman container exists $(TAG) || podman create --name $(TAG) --device=/dev/dri --volume $(DBUS_SOCKET_PATH):/tmp/bus:z --volume "$$XDG_RUNTIME_DIR/pipewire-0":/tmp/run/pipewire-0:z --volume "$$XDG_RUNTIME_DIR/$$WAYLAND_DISPLAY":/tmp/run/wayland-0:z --env WAYLAND_DISPLAY --env DISPLAY --security-opt label=type:container_runtime_t --pid host -it $(TAG)

start:
	podman start $(TAG)

attach:
	podman attach $(TAG)

clean:
	podman rm $(TAG)


