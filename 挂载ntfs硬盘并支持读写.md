


## 挂载脚本命令

卸载时直接去 目录下弹出即可 或者通用卸载命令  `sudo diskutil umount /Volumes/磁盘名称`  即可

```bash
#/bin/bash
# 自动挂载 ntfs 硬盘的脚本。 支持读写。 但是只支持一个ntfs磁盘， 多磁盘需要修改脚本。

PASSWD="用户密码"

DISK_INFO=$(diskutil list |  grep 'Microsoft Basic' )
DISK_NAME=$(echo ${DISK_INFO} | awk '{print $5}')
DISK_NUM=$(echo ${DISK_INFO} | awk '{print $8}' ) #  |  sed 's/\s.$//g')  # 最后的 sed 去掉 disk0s2 的末尾 s2 字段
DISK_PWD="/Volumes/${DISK_NAME}"

if [ "${DISK_INFO}" == "" ] ; then
		echo "无 NTFS 格式的磁盘，退出程序"
		exit;
fi

#### DEBUG信息 ####
echo ${DISK_INFO}
echo ${DISK_NAME}
echo ${DISK_NUM}
echo ${DISK_PWD}
###################


echo ${PASSWD} | sudo -S  diskutil unmountDisk ${DISK_NUM} 
echo ${PASSWD} | sudo -S  mkdir "${DISK_PWD}"
echo ${PASSWD} | sudo -S  mount_ntfs -o rw,nobrowse "/dev/${DISK_NUM}"  "${DISK_PWD}"

echo "挂载完成"
echo "卸载硬盘时需要手动到 ${DISK_PWD} 目录下操作, 或执行命令 : \'sudo diskutil umount ${DISK_PWD}\'"

open "${DISK_PWD}"
```

