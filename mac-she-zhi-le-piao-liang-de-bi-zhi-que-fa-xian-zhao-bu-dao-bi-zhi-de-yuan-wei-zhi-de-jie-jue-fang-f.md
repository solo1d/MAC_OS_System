# Mac设置了漂亮的壁纸，却发现找不到壁纸的原位置的解决方法

## Mac设置了漂亮的壁纸，却发现找不到壁纸的原位置的解决方法

**终端命令：显示壁纸所在路径（路径显示在屏幕对应壁纸上）**：  
&gt;&gt;&gt;&gt; **`defaults write com.apple.dock desktop-picture-show-debug-text -bool TRUE;killall Dock`**

**终端命令：隐藏该路径：**  
&gt;&gt;&gt;&gt;  
**`defaults delete com.apple.dock desktop-picture-show-debug-text;killall Dock`**

