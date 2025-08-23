#!/bin/bash

clear

source ./install/init.sh
source ./install/config/bootstrap.sh

# Source all script under install/apps
for script in ./install/apps/*.sh; do
  source "$script"
done

# Source all scripts under desktop
for script in ./install/desktop/*.sh; do
  source "$script"
done

# Installation des WebApps de base
source ./install/config/webapp.sh