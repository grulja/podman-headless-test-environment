#!/bin/sh

# Set DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_ADDRESS=$DBUS_SOCKET_PATH/bus-$(echo $DISPLAY | tail -c 2)

# Run Mutter
mutter --wayland --headless --virtual-monitor 1280x720 --no-x11 &

sleep infinity
