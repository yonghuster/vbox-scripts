running_vm=`vagrant global-status | grep "virtualbox running" | awk '{print $1}'`
if [ -z $running_vm ]
then
	echo "no running vm exists"
else
	echo "$running_vm is running, so connecting to it via SSH!"
	vagrant ssh $running_vm
fi

