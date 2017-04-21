#!/bin/bash

# Create VM
VBoxManage createvm --name "xpenology" --register

# Basic config
VBoxManage modifyvm "xpenology" --memory 512 --ostype "debian_64" --nictype1 82540EM --audio none --usb off --nic1 nat

# Add IDE « Boot Drive »
VBoxManage storagectl "xpenology" --name "IDE Controller" --add ide
VBoxManage storageattach "xpenology" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium synoboot.vmdk

# Add SCSI Drive
VBoxManage storagectl "xpenology" --name "SCSI Controller" --add scsi
vboxmanage createmedium disk --filename hd1.vdi --size 20000
VBoxManage storageattach "xpenology" --storagectl "SCSI Controller" --port 0 --device 0 --type hdd --medium hd1.vdi

# Port Forward
VBoxManage modifyvm "xpenology" --natpf1 "app,tcp,,5000,,5000"

# Start
VBoxManage startvm "xpenology" --type headless

# Stop
# vboxmanage controlvm xpenology poweroff
