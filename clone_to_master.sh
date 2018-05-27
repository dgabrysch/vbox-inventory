#!/bin/bash -x

BASEDIR="$HOME" + "/" + "VirtualBox\ VMs"
MACHINE_NAMES=(centos-k8s-master1 centos-k8s-master2 centos-k8s-master3)
for i in "${MACHINE_NAMES[@]}" 
do
VBoxManage controlvm $i poweroff
VBoxManage unregistervm $i --delete
VBoxManage clonevm centos-k8s-master-machine --name $i
VBoxManage registervm /home/day/VirtualBox\ VMs/$i/$i.vbox
VBoxManage startvm $i
done
