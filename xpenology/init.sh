#!/bin/bash

VMNAME=$1
if [ -z $VMNAME ];then
  VMNAME="xpenology"
fi

# Create VM
VBoxManage createvm --name $VMNAME --register

# Basic config
VBoxManage modifyvm $VMNAME --memory 1024 --ostype "debian_64" --nictype1 82540EM --audio none --usb off --nic1 nat --nataliasmode1 proxyonly --uart1 0x3F8 4 --uartmode1 server $VMNAME-serial

# Add IDE « Boot Drive »
VBoxManage storagectl $VMNAME --name "IDE Controller" --add ide
VBoxManage storageattach $VMNAME --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium synoboot.vmdk

# Add SCSI Drive
VBoxManage storagectl $VMNAME --name "SCSI Controller" --add scsi
# Create a 20Gb SCSI drive
vboxmanage createmedium disk --filename hd1.vdi --size 20000
VBoxManage storageattach $VMNAME --storagectl "SCSI Controller" --port 0 --device 0 --type hdd --medium hd1.vdi

# Port Forward
VBoxManage modifyvm $VMNAME --natpf1 "app,tcp,,5000,,5000"

# Start
VBoxManage startvm $VMNAME --type headless

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
