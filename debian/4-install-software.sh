#!/bin/bash

# 设置在遇到错误时自动退出
set -e

# 读取用户密码
read -p "请输入你的登陆密码：" password

# 用于浏览和安装 GNOME Shell 扩展的实用程序。
flatpak install flathub com.mattjakeman.ExtensionManager -y
# 可让您一键保存当前配置（主题、图标、壁纸、所有桌面环境设置、扩展等）
flatpak install flathub io.github.vikdevelop.SaveDesktop -y
# U盘镜像刻录
flatpak install flathub com.system76.Popsicle -y
# 聊天、通讯
flatpak install flathub com.qq.QQ -y
flatpak install flathub com.tencent.WeChat -y
# 腾讯会议
flatpak install flathub com.tencent.wemeet -y
# YesPlayMusic音乐
flatpak install flathub io.github.qier222.YesPlayMusic -y
# Chrome浏览器
flatpak install flathub com.google.Chrome -y
# 百度网盘
flatpak install flathub com.baidu.NetDisk -y
# Flatseal 是一个图形实用程序，用于查看和修改 Flatpak 应用程序的权限。
flatpak install flathub com.github.tchx84.Flatseal -y
# 以上软件是基本必装的常用软件
# Obsidian 文本编辑器
flatpak install flathub md.obsidian.Obsidian -y
# 雷鸟邮箱
flatpak install flathub org.mozilla.Thunderbird -y

# 下载安装非软件商城编程软件
cd $HOME/下载
# -O 选项指示curl将下载的文件保存为与远程文件相同的文件名，为大写字母
# 使用`-OJ`选项参数后，`curl`会从URL中提取文件名，并将其用作保存文件的名称。
# toolbox
curl -fsSL -OJ https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.1.31116.tar.gz
# 解压缩 .tar.gz 文件
tar xzf jetbrains-toolbox-2.3.1.31116.tar.gz
# 重命名
mv jetbrains-toolbox-2.3.1.31116 ToolBox
# 给AppImage文件授予可执行权限
chmod +x ToolBox/jetbrains-toolbox
# 将软件目录移动到 /opt 目录，需要管理员权限
echo $password | su -c "mv ToolBox /opt" -s /bin/bash root

# Apifox
curl -fsSL -OJ https://file-assets.apifox.com/download/Apifox-linux-deb-latest.zip
# 解压 ZIP 压缩文件
unzip Apifox-linux-deb-latest.zip
cd Apifox-linux-deb-latest
package_name=$(ls | grep deb)
echo $password | su -c "apt install ./$package_name -y" -s /bin/bash root




