# MAC safari 无法访问 127.0.0.1 解决方案

打开终端

```text
mac>   cd /private/etc
mac>   sudo  vim  hosts

#注释掉文件中的下面这行, 然后保存, 重启电脑就可以访问了.
::1     localhost
```





