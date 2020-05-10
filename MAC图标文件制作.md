## 为MacOS应用设置图标

- **制作图标文件**
  - 需要的原始图片文件必须为 `.png` 格式
  - 使用命令行来制作图标

```bash
# 将准备好的  pic.png 文件放到当前目录
# 创建icons.iconset目录（这里在当前用户的桌面创建），用来放置不同尺寸的图标
$ mkdir icons.iconset       # 目前这里还是空目录

# 使用命令来生成不同尺寸的图片, 后面的文件名必须一一对应
$sips -z 16 16     pic.png --out icons.iconset/icon_16x16.png

$sips -z 32 32     pic.png --out icons.iconset/icon_16x16@2x.png

$sips -z 32 32     pic.png --out icons.iconset/icon_32x32.png

$sips -z 64 64     pic.png --out icons.iconset/icon_32x32@2x.png

$sips -z 64 64     pic.png --out icons.iconset/icon_64x64.png

$sips -z 128 128   pic.png --out icons.iconset/icon_64x64@2x.png

$sips -z 128 128   pic.png --out icons.iconset/icon_128x128.png

$sips -z 256 256   pic.png --out icons.iconset/icon_128x128@2x.png

$sips -z 256 256   pic.png --out icons.iconset/icon_256x256.png

$sips -z 512 512   pic.png --out icons.iconset/icon_256x256@2x.png

$sips -z 512 512   pic.png --out icons.iconset/icon_512x512.png

$sips -z 1024 1024   pic.png --out icons.iconset/icon_512x512@2x.png


# 生成图标,  -c 目录  -o 生成出来的图标文件
$ iconutil -c icns icons.iconset -o Icon.icns
```

- 将 得到的图标文件设置到 qt 中
  - **将上面生成的Icon.icns复制到项目的根目录下**
  - **在项目资源内添加该图标文件**
  - **在 .pro 项目文件中添加如下内容即可**
    - `ICON = Icon.icns`
      - 这个方法只适合于 `qmake`  的构建方式
        - 其他的在帮助文档中查找 `Setting the Application Icon` 来进行确定



