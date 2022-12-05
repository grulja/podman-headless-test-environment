#!/bin/sh

# Set DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_ADDRESS=$DBUS_SOCKET_PATH/bus-$(echo $DISPLAY | tail -c 2)

# Run DBus session
dbus-daemon --session --address=$DBUS_SESSION_BUS_ADDRESS --fork

# Run xdg-desktop-portal
/usr/libexec/xdg-desktop-portal

sleep infinity
