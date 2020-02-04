# 强制切换显卡命令 \(增加续航\)

```bash
$ sudo pmset -a GPUSwitch 0 //强制使用集显      (google 浏览器关闭硬件加速后的默认设置)
$ sudo pmset -a GPUSwitch 1 //强制使用独显      (关闭节能后的默认设置)
$ sudo pmset -a GPUSwitch 2 //自动切换模式      (系统默认模式)
```

