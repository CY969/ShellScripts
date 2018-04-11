#! /bin/bash/
#yum local source
#mount device                                      #先挂载
mount /dev/sr0 /mnt
#backup original files
if [ ! -d /etc/yum.repos.d/back ]                  #[]内加空格，否定方括号内加！
	then mkdir /etc/yum.repos.d/back
fi

if [ -f /etc/yum.repos.d/C* ]
	then mv /etc/yum.repos.d/C* /etc/yum.repos.d/back
fi
#edit yum config file
echo -e >>/etc/yum.repos.d/yum.repo "\n[yumlocal]\nname=local\nenable=1\ngpgcheck=0\nbaseurl=file:///mnt" # -e 转义符生效
yum clean all
yum makecache
yum repolist
