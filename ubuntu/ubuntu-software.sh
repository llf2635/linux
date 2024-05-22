#!/bin/bash

echo "==========开始安装工作和娱乐常用软件工具=========="

# 可让您一键保存当前配置（主题、图标、壁纸、所有桌面环境设置、扩展等）
flatpak install flathub io.github.vikdevelop.SaveDesktop -y
# 聊天、通讯
flatpak install flathub com.qq.QQ -y
flatpak install flathub com.tencent.WeChat -y
# YesPlayMusic音乐
flatpak install flathub io.github.qier222.YesPlayMusic -y
# 百度网盘
flatpak install flathub com.baidu.NetDisk -y
# Flatseal 是一个图形实用程序，用于查看和修改 Flatpak 应用程序的权限。
flatpak install flathub com.github.tchx84.Flatseal -y
# 以上软件是基本必装的常用软件
# Obsidian 文本编辑器
flatpak install flathub md.obsidian.Obsidian -y
# 安装邮箱等
sudo apt install evolution libreoffice firefox-esr -y

# 下载安装非软件商城编程软件
cd $HOME/下载
echo "==========开始安装 jetbrains-toolbox 代码编辑器管理工具=========="
# -O 选项指示curl将下载的文件保存为与远程文件相同的文件名，为大写字母
# 使用`-OJ`选项参数后，`curl`会从URL中提取文件名，并将其用作保存文件的名称。
# toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.1.31116.tar.gz
# 解压缩 .tar.gz 文件
tar -xvf jetbrains-toolbox-2.3.1.31116.tar.gz
# 重命名
mv jetbrains-toolbox-2.3.1.31116 ToolBox
# 给AppImage文件授予可执行权限
chmod +x ToolBox/jetbrains-toolbox
# 将软件目录移动到 /opt 目录，需要管理员权限
sudo mv ToolBox /opt
# 安装启动 AppImage 应用所需的依赖，FUSE 库支持，必须安装
sudo apt install libfuse2 -y
# 执行 AppImage 文件来启动应用程序，第一次需要运行一下才能被系统识别出图标
/opt/ToolBox/jetbrains-toolbox
echo "==========开始jetbra破解工具包=========="
wget -O jetbra.zip https://hardbin.com/ipfs/bafybeiawsvnhqx5o2aqa37pvq7brlk7vqj2cpty3b5xac655bxbpqbpkq4/files/jetbra-ded4f9dc4fcb60294b21669dafa90330f2713ce4.zip
# 解压 ZIP 压缩文件，使用 unzip 解压直接得到里面内容，也可以后面指定目录
unzip jetbra.zip
# 重命名文件夹
mv jetbra .jetbra
# 移动文件夹到用户主目录
mv .jetbra $HOME

echo "==========开始安装 Apifox 接口测试工具=========="
# Apifox
wget https://file-assets.apifox.com/download/Apifox-linux-deb-latest.zip
# 解压 ZIP 压缩文件，使用 unzip 解压直接得到里面内容，也可以后面指定目录
unzip Apifox-linux-deb-latest.zip -d Apifox-linux-deb-latest
cd Apifox-linux-deb-latest
package_name=$(ls | grep deb)
sudo apt install ./$package_name -y

echo "==========开始安装 virtual+vagrant 虚拟机环境=========="
# 下载 vagrant virtualbox
sudo apt install vagrant virtualbox -y

echo "==========开始安装 WindTerm_远程连接SSH软件工具=========="
wget https://github.com/kingToolbox/WindTerm/releases/download/2.6.0/WindTerm_2.6.1_Linux_Portable_x86_64.tar.gz
# 解压缩 .tar.gz 文件
tar -xvf WindTerm_2.6.1_Linux_Portable_x86_64.tar.gz
# 重命名文件夹
mv WindTerm_2.6.1 WindTerm
# 移动文件夹到 /opt
sudo mv WindTerm /opt
# 进入到 /opt/WindTerm 文件夹
cd /opt/WindTerm
# 执行权限
sudo chmod +x WindTerm
# 给快捷方式文件添加公共读取权限，让其能够被系统读取识别
sudo chmod +r windterm.desktop
# 请注意，路径中的斜杠 / 需要使用反斜杠 \ 进行转义，否则会被解释为分隔符。
sudo sed -i 's/Icon=windterm/Icon=\/opt\/WindTerm\/windterm.png/g' windterm.desktop
sudo sed -i 's/Exec=\/usr\/bin\/windterm/Exec=\/opt\/WindTerm\/WindTerm/g' windterm.desktop
# 移动desktop文件到 /usr/share/applications
sudo cp windterm.desktop /usr/share/applications
# 修改 windterm 主题字体大小
cd global/themes
sudo sed -i 's/font-size: 9pt/font-size: 12pt/g' dige-black/gui.theme
sudo sed -i 's/font-size: 9pt/font-size: 12pt/g' dige-white/gui.theme
sudo sed -i 's/font-size: 9pt/font-size: 12pt/g' dige-black-and-white/gui.theme

echo "==========完成安装工作和娱乐常用软件工具=========="



