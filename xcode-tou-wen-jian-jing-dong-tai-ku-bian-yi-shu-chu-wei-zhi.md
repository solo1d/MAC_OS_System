# Xcode\_头文件\_静动态库\_编译输出位置

## Xcode_头文件_静动态库\_编译输出位置 <a id="xcode-tou-wen-jian-jing-dong-tai-ku-bian-yi-shu-chu-wei-zhi"></a>

**xcode 项目中, 各种位置的设置, \(完全可以使用,支持版本 10.2.1\)**‌

## 头文件位置:  <a id="tou-wen-jian-wei-zhi"></a>

 `项目设置 -> PROJECT -> Build Settings -> All[Combined] -> Search Paths -> Header Search   Paths 或者 User Header Search Paths`‌

**\(Header Search Paths: 添加\#include 的路径, User Header Search Paths: 添加\#include "x.h" 路径 \)**‌

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LhTcn8tixb4Jg0Ybtbr%2F-LhTdCCiI9wQtRYtrfLO%2F-LhTemGFz2CL-vXs3P9k%2F%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A72019-06-1612.59.50.png?alt=media&token=bc66a3d0-bd5f-4636-8ec4-3f7c8231bcfc)

## 添加动态库和静态库文件 <a id="tian-jia-dong-tai-ku-he-jing-tai-ku-wen-jian"></a>

`项目设置 -> TARGETS -> 生成应用名称 -> General -> Linked Frameworks and Libraries` **\( 在这里添加批量添加静态库文件, 点击加号, 在弹出框内 再点击 Add Other... ,选择静态库文件和动态库文件就行 \)**‌

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LhTcn8tixb4Jg0Ybtbr%2F-LhTdCCiI9wQtRYtrfLO%2F-LhTfKuoOZTV-h4vAD3G%2F%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A72019-06-1613.04.05.png?alt=media&token=f7641a64-7fe3-4ebd-b2e2-830ca9652f1c)

## 动/静 态库位置 <a id="dong-jing-tai-ku-wei-zhi"></a>

`项目设置 -> TARGETS -> 生成应用名称 -> Build Settings -> All[Combined] -> Search Paths -> Library Search Path` **\( 在选项内添加 动态库 所在的路径, 已有的内容不要删 \)**‌

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LhTcn8tixb4Jg0Ybtbr%2F-LhTdCCiI9wQtRYtrfLO%2F-LhTgtzescIcBGpQy2RT%2F%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A72019-06-1613.08.00.png?alt=media&token=495ecf33-40ed-4e9d-8a49-f754422c8f2a)

## 编译输出位置 <a id="bian-yi-shu-chu-wei-zhi"></a>

`项目设置 -> TARGETS -> 生成应用名称 -> Build Settings -> All[Combined] -> Build Locations -> Per-configuration Build Produtes Path`‌

\( **将选项内的 第一个$ 之前的内容修改为 路径就行 , 范例:** /Users/ns/Xcode/test/test/$\(CONFIGURATION\)$\(EFFECTIVE\_PLATFORM\_NAME\)**\)**

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LhTcn8tixb4Jg0Ybtbr%2F-LhTdCCiI9wQtRYtrfLO%2F-LhThihzDE2f5IsrikWv%2F%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A72019-06-1613.14.08.png?alt=media&token=ddc5dc18-6c63-4340-bb4b-5c73a8e8ecca)

