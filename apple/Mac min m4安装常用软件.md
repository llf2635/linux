## macOS 使用小工具

https://www.better365.cn/tv.html



以下是使用 **Homebrew** 安装编程常用软件的完整指南，涵盖开发工具、语言环境、数据库、编辑器等关键工具，并针对 macOS 优化体验：

---

### **一、基础开发工具**
| 工具       | 安装命令              | 作用说明                                               |
| ---------- | --------------------- | ------------------------------------------------------ |
| **Git**    | `brew install git`    | 版本控制工具（必装）                                   |
| **HTTPie** | `brew install httpie` | 现代 HTTP 客户端（替代 `curl、wget`，调试 API 更友好） |
| **jq**     | `brew install jq`     | 命令行 JSON 处理器（处理 API 响应必备）                |

---

### **二、编程语言环境**
#### **1. Java 开发**
| 工具       | 安装命令                        | 说明                                      |
| ---------- | ------------------------------- | ----------------------------------------- |
| **SDKMAN** | `http -q https://get.sdkman.io` | JDK 多版本管理工具                        |
| **JDK**    | `sdk install java 21.0.6-tem`   | 推荐 Temurin JDK（ARM 原生优化，适合 M4） |
| **Maven**  | `sdk install maven`             | Java 项目构建工具                         |
| **Gradle** | `sdk install gradle`            | 灵活构建工具（适合复杂项目）              |

#### **2. Node.js 开发**
| 工具        | 安装命令                  | 说明                                                         |
| ----------- | ------------------------- | ------------------------------------------------------------ |
| **nvm**     | `brew install nvm`        | Node.js 多版本管理工具                                       |
| **Node.js** | `nvm install --lts`       | 安装最新 LTS 版本，默认自带 npm。 `npm config set registry https://registry.npmmirror.com` |
| **bun**     | `sudo npm install -g bun` | 高效包管理工具和高性能运行时                                 |

#### **3. Python 开发**
| 工具       | 安装命令                   | 说明                                       |
| ---------- | -------------------------- | ------------------------------------------ |
| **Python** | `brew install python@3.12` | 安装指定版本（避免使用 macOS 自带 Python） |
| **pyenv**  | `brew install pyenv`       | Python 多版本管理工具                      |
| **pipx**   | `brew install pipx`        | 安全安装全局 Python CLI 工具               |

---

### **三、数据库与中间件**
| 工具           | 安装命令                     | 作用说明                                     |
| -------------- | ---------------------------- | -------------------------------------------- |
| **PostgreSQL** | `brew install postgresql@17` | 关系型数据库（开发环境轻量使用）             |
| **Redis**      | `brew install redis`         | 内存数据库（缓存、Session 管理）             |
| **MySQL**      | `brew install mysql@8.4`     | 可选替代方案（根据项目需求）                 |
| **Docker**     | `brew install --cask docker` | 容器化开发（Apple Silicon 需确认镜像兼容性） |

---

### **四、编辑器与 IDE**
| 工具              | 安装命令                                 | 说明                               |
| ----------------- | ---------------------------------------- | ---------------------------------- |
| **VSCode**        | `brew install --cask visual-studio-code` | 轻量级编辑器（适合前端和全栈开发） |
| **IntelliJ IDEA** | `brew install --cask intellij-idea`      | Java 开发首选 IDE（社区版免费）    |
| **PyCharm**       | `brew install --cask pycharm`            | Python 专业 IDE                    |

---

### **五、效率工具**
| 工具          | 安装命令                                                     | 作用说明                           |
| ------------- | ------------------------------------------------------------ | ---------------------------------- |
| **iTerm2**    | `brew install --cask iterm2`                                 | 增强终端（支持分屏、快捷键、主题） |
| **Oh My Zsh** | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` | Zsh 配置框架（提升终端体验）       |
| **htop**      | `brew install htop`                                          | 进程监控工具（实时查看资源占用）   |
| **ncdu**      | `brew install ncdu`                                          | 磁盘空间分析工具                   |

---

### **六、服务管理**
使用 `brew services` 管理后台服务（如数据库）：
```bash
brew services start <formula>  # 启动单个服务（如 mysql、nginx）
brew services start --all      # 启动所有已安装服务
# 启动 PostgreSQL
brew services start postgresql@17

# 停止 Redis
brew services stop redis

brew services start mysql    # 启动并注册自启
brew services stop mysql     # 停止并取消自启
brew services restart mysql  # 重启服务

# 查看所有服务状态
brew services list

# 移除已卸载服务残留的 launchd 配置文件
brew services cleanup
```

---

### **七、一键安装脚本**
复制以下命令一次性安装常用工具：
```bash
# 显示隐藏文件/文件夹
shift + command/win + .

# 更新软件源
brew update
# 升级所有软件包
brew upgrade
# 查看已安装包
brew list
# 清理旧版本/缓存
brew cleanup

# 基础开发工具
brew install git make httpie jq
git config --global user.name "龙茶清欢"
git config --global user.email "2320391937@qq.com"
ssh-keygen -t rsa -b 4096 -C "2320391937@qq.com"
cat ~/.ssh/id_rsa.pub
# 添加 SSH Key
https://gitee.com/profile/sshkeys
https://github.com/settings/keys

# Java 开发
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.6-graal
sdk install java 21.0.6-tem
java —version
sdk install maven
mvn -v
# IDEA 配置 Maven，避免使用默认的 Maven。IDEA默认会在 ~/.m2/wrapper 目录下Maven包。需要使用 Command + Shift + . 显示隐藏文件夹
sdk install gradle
gradle -v

# Node.js 开发
brew install nvm
nvm install --lts
npm config set registry https://registry.npmmirror.com
sudo npm install -g bun
bun --version

# 数据库
brew install postgresql@16 redis docker

# 编辑器
brew install --cask visual-studio-code jetbrains-toolbox
brew install --cask tabby apifox typora switchhosts virtualbox vagrant
VBoxManage --version	# 输出类似 7.0.14r161095 表示成功
vagrant --version			# 输出类似 Vagrant 2.4.0 表示成功

# 效率工具
brew install --cask iterm2
brew install htop ncdu

# brew 的图形化软件管理软件
brew search applite
brew install --cask applite
brew uninstall --cask applite

# 音乐软件、小米投屏
brew install --cask yesplaymusic hyperconnect

# 配置 Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

### **八、优化建议**
1. **国内镜像加速**：
   ```bash
   # 替换为中科大源
   git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
   git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
   brew update
   ```

2. **资源占用控制**：
   - 使用 `htop` 监控进程，按需启停服务。
   - 优先选择轻量工具（如 `pnpm` 替代 `npm`）。

3. **多版本管理**：
   - **Node.js**：通过 `nvm` 安装多版本：
     ```bash
     nvm install 20
     nvm use 20
     ```
   - **Python**：通过 `pyenv` 管理版本：
     ```bash
     pyenv install 3.12.1
     pyenv global 3.12.1
     ```

---

### **九、验证安装**
```bash
# 检查 Java
java -version

# 检查 Node.js
node -v
npm -v

# 检查 PostgreSQL
psql --version

# 检查 Docker
docker --version
```

完成后，你的开发环境就准备就绪了！ 🚀




### 关于 `brew install --cask` 参数的解析

`--cask` 是 Homebrew 命令中的关键参数，用于指定安装或管理的对象类型为**图形界面应用程序**（GUI）。以下为其核心作用与使用场景说明：

#### **功能定义**
- **区分安装类型**  
  Homebrew 默认通过 `brew install` 安装**命令行工具**（CLI），而 `--cask` 明确告知 Homebrew 当前操作目标为带有图形界面的 macOS 应用程序（如浏览器、IDE 等）。例如，安装 Docker 桌面版需执行 `brew install --cask docker`，此时 Homebrew 会从专为 GUI 程序设计的 Cask 仓库获取安装包。

#### **管理特性**
- **标准化安装路径**  
  使用 `--cask` 安装的应用程序会自动部署至系统的 `/Applications` 目录，与手动下载安装的行为一致，方便用户通过 Launchpad 或 Finder 直接访问。
- **集中化版本管理**  
  支持通过 `brew upgrade --cask` 统一更新所有已安装的 GUI 应用程序，或通过 `brew outdated --cask` 查看可升级的软件列表，避免传统手动更新的繁琐流程。

#### **使用建议**
- **明确场景选择**  
  若需安装开发工具链（如 Git、Node.js）或服务类程序（如 MySQL），直接使用 `brew install` 即可；若目标为图形化应用（如 IntelliJ IDEA、Visual Studio Code），则必须附加 `--cask` 参数。
- **避免混淆的注意事项**  
  部分 GUI 应用可能同时提供 CLI 和图形界面版本（如 VS Code 的 `code` 命令行工具）。此时需根据实际需求判断是否需要附加 `--cask`，但通常通过 `--cask` 安装主程序后，相关命令行工具会自动集成。





\# 安装 Homebrew 软件包管理器，相当于 apt、pacman	官方网址 https://brew.sh/zh-cn/

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



brew install mysql

mysql --version

brew services start mysql

mysql_secure_installation

mysql -u root





brew tap hashicorp/tap
brew install hashicorp/tap/hashicorp-vagrant







\# 安装 sdk

curl -s "https://get.sdkman.io" | bash

sdk install java 21.0.5-graal

java —version

sdk install maven

mvn -v

sdk install gradle

gradle -v



# 安装 Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"



\# 安装 nvm	官网 https://github.com/nvm-sh/nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

nvm -v

nvm —help

nvm install --lts

node -v

npm -v

npm config set registry https://registry.npmmirror.com

npm config get registry



sudo npm install -g bun

bun -v

如果想要使用 tauri 需要先安装 Xcode

bun create tauri-app



https://github.com/oldj/SwitchHosts/releases

https://apifox.com/

https://www.jetbrains.com/zh-cn/lp/toolbox/

https://typoraio.cn/









-Xms1g
-Xmx5g
-XX:+UnlockExperimentalVMOptions
-XX:+UseZGC
-XX:ReservedCodeCacheSize=512m
-XX:+IgnoreUnrecognizedVMOptions
-XX:SoftRefLRUPolicyMSPerMB=50
-XX:CICompilerCount=2
-XX:+HeapDumpOnOutOfMemoryError
-XX:-OmitStackTraceInFastThrow
-ea
-Dsun.io.useCanonCaches=false
-Djdk.http.auth.tunneling.disabledSchemes=""
-Djdk.attach.allowAttachSelf=true
-Djdk.module.illegalAccess.silent=true
-Dkotlinx.coroutines.debug=off
-Drecreate.x11.input.method=true
-XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
-XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof

--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
-javaagent:/Users/lcqh/.jetbra/ja-netfilter.jar=jetbrains