# app已损坏解决方案

```bash
$ sudo spctl --master-disable
```

**然后去设置   -&gt; 安全与隐私   -&gt;  通用   -&gt; 允许任何来源**

# xxx已损坏，打不开。您应该将它移到废纸篓以及来自身份不明的开发者的解决方法

```bash
sudo xattr -r -d com.apple.quarantine <path> 
#其中<path>为软件路径 <path>为软件路径，也就是复制代码，去掉<path>，直接从应用程序里拖入终端即可。注意：<path>前面有个空格！！！！！！
```

