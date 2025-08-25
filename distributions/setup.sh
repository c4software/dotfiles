#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

# Init Configuration
source "./common/install/bootstrap.sh"

if command -v pacman &> /dev/null; then
    source "./archlinux/setup.sh"
    source "./common/install/webapp.sh"
elif command -v dnf &> /dev/null; then
    source "./fedora/setup.sh"
    source "./common/install/webapp.sh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source "./macos/setup.sh"
else
    echo "Unsupported distribution."
    exit 1
fi