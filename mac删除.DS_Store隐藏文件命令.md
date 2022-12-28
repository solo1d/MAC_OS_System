

```bash
 find "/Users/ns/工作/" -name ".DS_Store"  | xargs rm -rf
```



### 具体化脚本

```bash
#!/bin/bash

PASS="密码"

echo "检索到 .DS_Store 文件数量有： "
find "${HOME}" -name ".DS_Store"  | wc -l

echo ${PASS} | sudo -S  find "${HOME}/目录" -name ".DS_Store" -depth -exec rm {} \;  2>/dev/null 1>/dev/null
echo "清理已完成, 正在检查是否还有 .DS_Store 文件:"
find "/Users/ns/工作/" -name ".DS_Store" | wc -l
echo "检查完成, 如果存在 .DS_Stre 文件, 请再次执行该程序"
sleep 1

exit
```

