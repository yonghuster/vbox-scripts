VM_NAME=$1
if [ -z $VM_NAME ]
then
    echo "Error: the VM name need be specified!"
    exit
fi


#search Virtual Box VM folds
DEFAULT_VM_FOLDER=/home/`whoami`/"VirtualBox VMs"
CONFIG_FILE="${DEFAULT_VM_FOLDER}/${VM_NAME}/${VM_NAME}.vbox"
echo $CONFIG_FILE
if [ -f "${CONFIG_FILE}" ]
then
	#search the VM UUID
	#VM_UUID=`VBoxManage list -s runningvms | grep ${VM_NAME} | awk '{split($0,a,"{"); print a[2]}' | awk '{split($0,b, "}"); print b[1]}'`
	#echo ${VM_UUID}
	Running_VM=`VBoxManage list -s runningvms | grep ${VM_NAME} | awk '{print $1}'`
	if [ ! -z "${Running_VM}" ]
	then
	    echo "${Running_VM} is already running!"
	    exit
	else
  	    #start the VM with VBoxHeadless
	    echo "starting ${Running_VM} ......"
	    /usr/lib/virtualbox/VBoxHeadless --comment "${VM_NAME}" --startvm "${VM_NAME}" --vrde config &
	fi
else
	echo "${CONFIG_FILE} does not exist"
	exit
fi

