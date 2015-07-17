#!/bin/sh

for i in $(ls /sys/bus/pci/drivers/ehci-pci/|grep :)
 do echo $i >/sys/bus/pci/drivers/ehci-pci/unbind
 echo $i >/sys/bus/pci/drivers/ehci-pci/bind
done