# scp 服务器文件上传和下载命令

### 下载 服务器的整个文件夹内容  到本地

```bash
$ scp  -r  root@110.255.255.52:/root/htmltitle   /Users/xxx/Desktop
 #描述:    scp -r 远程登录服务器用户名@远程服务器ip地址:/下载文件夹的目录     本地目录
```

### 下载 服务器文件 到本地

```bash
$ scp root@110.255.250.52:/root/htmltitle/htmltitle  /Users/xxx/Desktop
  #描述:  scp 远程登录服务器用户名@远程服务器ip地址:/下载文件的目录    本地目录
```

### 上传 本地文件  到 服务器文件夹下

```bash
# 打开终端， 进入上传文件的目录。 然后输入下面的命令
$ scp -r htmltitle.cpp    root@139.59.250.52:/root/htmltitle
   #描述 scp -r 本地目录    远程登录服务器用户名@远程服务器ip地址:/文件上传的目录地址
```

