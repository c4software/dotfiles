## /etc/fstab

```conf
proc            /proc           proc    defaults          0       0
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    ro                0       1
# /dev/mmcblk0p2  /               ext4    defaults,noatime  0       1

tmpfs           /tmp            tmpfs   defaults,noatime,mode=1777      0       0
tmpfs           /var/log        tmpfs   defaults,noatime,mode=0755      0       0
tmpfs           /var/lib/systemd tmpfs   defaults,noatime,mode=0755      0       0
```
