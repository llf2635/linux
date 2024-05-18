#!/bin/bash

# 设置在遇到错误时自动退出
set -e

# 读取用户密码
read -p "请输入你的登陆密码：" password

echo "==========开始安装 fcitx5 中文输入法=========="
# 首先卸载旧版输入法，卸载与 fcitx5 冲突的所有依赖
sudo apt remove --purge fcitx ibus -y
# 安装fcitx5中文拼音输入法
sudo apt install fcitx5 fcitx5-chinese-addons && sudo apt autoremove -y

# 一键批量卸载snap安装软件
for p in $(snap list | awk '{print $1}'); do  
  sudo snap remove $p  
done
# 执行第二遍，必须
for p in $(snap list | awk '{print $1}'); do  
  sudo snap remove $p  
done
for p in $(snap list | awk '{print $1}'); do  
  sudo snap remove $p  
done

# 移除 Snapd 服务
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service

# 删除 Snap 的 Core 文件
for m in /snap/core/*; do  
   sudo umount $m  
done

sudo apt remove --autoremove snapd -y
# 删除 Snapd 的管理工具
sudo apt autoremove --purge snapd && sudo apt autoremove -y

# 删除 Snap 的目录
rm -rf ~/snap  
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd  
sudo rm -rf /var/cache/snapd
sudo rm -rf /etc/systemd/system/snap*
sudo rm -rf /etc/systemd/system/multi-user.target.wants/snap*
sudo apt update

# 禁用snap自动安装
# 这还没完，即使你用以上命令移除了 Snap 软件包，但是如果你没有关闭 apt 触发器，`sudo apt update` 命令会再一次将 Snap 安装回来。
# 配置 APT 参数：禁止 apt 安装 snapd
# 一键写入脚本，创建APT偏好设置文件并添加偏好设置
sudo bash -c "cat > /etc/apt/preferences.d/no-snapd.pref" << EOL  
Package: snapd
Pin: release a=* 
Pin-Priority: -10
EOL
# 显示设置的内容
cat /etc/apt/preferences.d/no-snapd.pref

# 添加火狐软件仓库
sudo add-apt-repository ppa:mozillateam/ppa

# 更新系统依赖
sudo apt update && sudo apt upgrade -y

# 清理无用的软件包
sudo apt autoremove && sudo apt autoclean -y 

# 下载系统基础工具，安装GNOME插件和扩展
sudo apt install gnome-tweaks gnome-software chrome-gnome-shell gnome-shell-extension-manager -y

# 安装并配置 flatpak
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# 配置 flatpak 上海交大下载加速镜像仓库
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub

# ubuntu配置debian软件库，并禁用ubuntu的snap软件库
sudo vim /etc/apt/sources.list.d/debian-sources
deb http://mirrors.ustc.edu.cn/debian/ bookworm main non-free-firmware

# 一键执行脚本，修复闪烁花屏
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.dcdebugmask=0x10 amdgpu.sg_display=0"/g' /etc/default/grub
grep "GRUB_CMDLINE_LINUX_DEFAULT" /etc/default/grub
sudo update-grub && sudo update-grub2

sudo apt update && sudo apt upgrade -y

# https://blog.csdn.net/huludan/article/details/138348869
# https://forum.ubuntu.com.cn/viewtopic.php?t=119954

