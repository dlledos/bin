#!/bin/sh 

# reseting USB3 ports (if there none you'll get errors)
for i in $(ls /sys/bus/pci/drivers/xhci_hcd/|grep :)
 do echo $i >/sys/bus/pci/drivers/xhci_hcd/unbind
 echo $i >/sys/bus/pci/drivers/xhci_hcd/bind
done

