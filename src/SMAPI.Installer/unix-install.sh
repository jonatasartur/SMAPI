#!/bin/bash
# Run the SMAPI installer through Mono on Linux or Mac.

# Move to script's directory
cd "`dirname "$0"`"

# get cross-distro version of POSIX command
COMMAND=""
if command -v command >/dev/null 2>&1; then
    COMMAND="command -v"
elif type type >/dev/null 2>&1; then
    COMMAND="type"
fi

# validate Mono & run installer
if $COMMAND mono >/dev/null 2>&1; then
    mono internal/Mono/install.exe
else
   echo "Oops! Looks like Mono isn't installed. Please install Mono from https://mono-project.com, reboot, and run this installer again."
   read
fi
