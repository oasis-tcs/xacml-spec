#!/usr/bin/env bash
 
set -e

# Add --print-address to dbus-daemon command to see the valid DBUS_SESSION_BUS_ADDRESS
dbus-daemon --config-file=/usr/share/dbus-1/system.conf 
# Print installed fonts for debugging
# fc-list
/usr/bin/google-chrome --headless=new --no-sandbox --no-pdf-header-footer --disable-gpu --disable-dev-shm-usage "$@"