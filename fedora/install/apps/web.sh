#!/bin/bash

dnf config-manager --set-enabled google-chrome
dnf check-update
dnf install -y google-chrome-stable