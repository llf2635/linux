# linux

#### 介绍
Debian系统初次安装后的四个脚本，分别如下：
1.  基础配置，例如：将当前用添加到 sudo 权限组、安装指纹模组、安装 fcitx5 中文输入法、卸载所有 Gnome 自带的小游戏等
2.  主题美化，例如：配置系统字体、光标主题、ICON主题、Shell主题、GTK主题、窗口行为和样式等
3.  开发环境配置，例如：安装 build-essential 基础依赖包、安装vim、sdkman、Java、Maven、NodeJs、Bun等
4.  安装常用软件，例如：Chrome浏览器、微信、QQ、百度网盘、Apifox、JetBrains-ToolBox等

#### 安装教程

1.  curl -sS https://gitee.com/llf2635/linux/blob/master/debian/1-basic-configuration.sh | bash
2.  curl -sS https://gitee.com/llf2635/linux/blob/master/debian/2-theme-beautify.sh | bash
3.  curl -sS https://gitee.com/llf2635/linux/blob/master/debian/3-install-environment.sh | bash
4.  curl -sS https://gitee.com/llf2635/linux/blob/master/debian/4-install-software.sh | bash

#### 使用说明
1.  请使用  
```bash
echo 你的登陆密码 | su -c "apt install git curl -y" -s /bin/bash root  
```
提前安装 curl、git 工具

