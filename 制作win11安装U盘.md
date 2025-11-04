>当前系统： sequioa 15.7.1
>
>
>
>1. 需要一个 Win11安装镜像和一个大于8G的U盘
>2. 安装拆分镜像工具 `brew install wimlib`



```bash
#1、查看U盘信息,diskutil list会列出所有的磁盘，找到你的U盘
$ diskutil list
# 省略无用的内容
/dev/disk6 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *30.8 GB    disk6
   1:                        EFI EFI                     209.7 MB   disk6s1
   2:       Microsoft Basic Data WIN11                   30.6 GB    disk6s2

/dev/disk7 (disk image):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                            PCHA_X64FREO_ZH-CN_DV9 +5.6 GB     disk7
   
#2、格式化为fat32格式,并将U盘更名为 WIN11
$  diskutil eraseDisk MS-DOS "WIN11" GPT /dev/disk6


#3、加载下载好的win11 iso
$ hdiutil mount ~/Download/Win11_24H2_Pro_Chinese_Simplified_x64.iso


#4、copy 镜像文件到U盘 (/Volumes/PCHA_X64FREO_ZH-CN_DV9 路径每个人可能不一样)
$ rsync -vha --exclude=sources/install.wim /Volumes/PCHA_X64FREO_ZH-CN_DV9/*  /Volumes/WIN11


#5、由于fat32单文件最大智能支持4G，ios超过了文件限制，使用wimlib拆分镜像
$ wimlib-imagex split /Volumes/PCHA_X64FREO_ZH-CN_DV9/sources/install.wim /Volumes/WIN11/sources/install.swm 4000 


# 完成
```

