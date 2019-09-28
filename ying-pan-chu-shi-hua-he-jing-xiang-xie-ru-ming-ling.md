# 硬盘初始化和镜像写入命令

```bash
格式化整个磁盘命令:  diskutil eraseDisk ExFAT NewDisk disk3  
格式化磁盘中的某个分区命令:  diskutil eraseVolume ExFAT NewVolume disk3s2
                    # diskutil  格式化格式   新磁盘的格式   新磁盘名   磁盘块设备名
   后面的参数可以用: diskutil list     来查询.
    

使用dd 命令来执行镜像的写入:
     sudo dd bs=4m if=/Volumes/500GB_DATA/镜像.img  of=/dev/rdisk3
```

