#!/bin/bash

# Create VM
VBoxManage createvm --name xpenology --register

# Basic config
VBoxManage modifyvm xpenology --memory 1024 --ostype "debian_64" --nictype1 82540EM --audio none --usb off --nic1 nat --nataliasmode1 proxyonly --uart1 0x3F8 4 --uartmode1 server xpenology-serial

# Add IDE « Boot Drive »
VBoxManage storagectl xpenology --name "IDE Controller" --add ide
VBoxManage storageattach xpenology --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium synoboot.vmdk

# Add SCSI Drive
VBoxManage storagectl xpenology --name "SCSI Controller" --add scsi
# Create a 20Gb SCSI drive
vboxmanage createmedium disk --filename hd1.vdi --size 20000
VBoxManage storageattach xpenology --storagectl "SCSI Controller" --port 0 --device 0 --type hdd --medium hd1.vdi

# Port Forward
VBoxManage modifyvm xpenology --natpf1 "app,tcp,,5000,,5000"

# Start
VBoxManage startvm xpenology --type headless

echo "In 1 or 2 minutes your VM should be accessible : http://localhost:5000"

# Save State
echo "To save the current state of your VM (for a restore later)"
echo "./control.sh save"

# Connect to serial console
echo "Connect to the Serial Console"
echo "./control.sh init"

# Stop
echo "To stop the VM (Hard off)"
echo "./control.sh stop"
