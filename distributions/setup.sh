#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

# Init Configuration
source "$SCRIPT_DIR/../common/install/bootstrap.sh"

# Installation des WebApps de base
source "$SCRIPT_DIR/../common/install/webapp.sh"


if command -v pacman &> /dev/null; then
    source "$(dirname "$0")/archlinux/setup.sh"
elif command -v dnf &> /dev/null; then
    source "$(dirname "$0")/fedora/setup.sh"
else
    echo "Unsupported distribution."
    exit 1
fi