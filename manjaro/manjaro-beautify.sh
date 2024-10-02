#!/bin/bash

echo "==========开始桌面美化配置=========="
# 更新系统
sudo pacman -S yay
yay -Syyu

nautilus admin:/usr/share/icons
nautilus admin:/usr/share/themes
yay -S aur/whitesur-gtk-theme aur/whitesur-icon-theme aur/whitesur-cursor-theme

echo "==========开始下载并配置gtk主题=========="
# 先创建一个主题存放目录，然后下载 WhiteSur 系统主题
cd $HOME/下载
directory="WhiteSur"
if [ -d "$directory" ]; then
    rm -rf "$directory"	
fi
mkdir $directory
echo "创建临时目录 WhiteSur 成功"
cd $directory

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
# 安装 WhiteSur GTK 主题包
./install.sh
# 将 WhiteSur 主题连接到 Flatpak（不支持 Snap）
./tweaks.sh -F
# 修复 Flatpak gtk-4.0 应用程序
sudo flatpak override --filesystem=xdg-config/gtk-4.0


# 修改 Firefox 主题
# 可以通过编辑
./tweaks.sh -f

# 修改锁屏登陆页主题
sudo ./tweaks.sh -g
# 查看所有命令的作用
# ./install.sh -h

echo "==========开始下载并配置icon图标主题=========="
# 快速安装 ICON 主题
cd ../
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd WhiteSur-icon-theme
# 安装 WhiteSur ICON 主题包
./install.sh -d $HOME/.icons

echo "==========开始下载并配置cursors光标主题=========="
# 快速安装 cursors 主题
cd ../
git clone https://github.com/vinceliuice/WhiteSur-cursors.git --depth=1
cd WhiteSur-cursors
# 安装 WhiteSur cursors 主题包
sudo ./install.sh

# 下载和安装壁纸
cd ../
wget -O wallpaper.jpg "https://gitee.com/llf2635/linux/raw/master/debian/wallpaper/b3eb9d03e5704f619f3fe55d809568ce.jpg"
picture_dir="$HOME/.local/share/backgrounds"
# 如果目录不存在
if [ ! -d "$picture_dir" ]; then
    mkdir -p "$picture_dir"	
fi
# 移动壁纸图片
mv -f wallpaper.jpg $picture_dir

echo "==========桌面美化配置完成=========="
