**Homebrew** 是 macOS（和 Linux）上的开源包管理器，用于简化软件的安装、更新和管理。它通过命令行操作，支持数千种开源工具和应用程序，尤其受开发者欢迎。

以下是 **Brew 的常见命令**及其作用，以表格形式整理：

| **命令**                   | **作用**                                                     |
| -------------------------- | ------------------------------------------------------------ |
| `brew install <包名>`      | 安装指定软件包（如 `brew install node`）                     |
| `brew uninstall <包名>`    | 卸载指定软件包                                               |
| `brew update`              | 更新 Homebrew 自身和软件包列表（不会更新已安装的包）         |
| `brew upgrade`             | 升级所有已安装的软件包                                       |
| `brew upgrade <包名>`      | 升级指定软件包                                               |
| `brew list`                | 列出所有已安装的软件包                                       |
| `brew search <关键词>`     | 搜索与关键词相关的软件包（支持模糊匹配）                     |
| `brew info <包名>`         | 显示软件包的详细信息（版本、依赖、文档等）                   |
| `brew doctor`              | 检查系统环境是否存在潜在问题，并提供修复建议                 |
| `brew cleanup`             | 清理旧版本软件包的缓存文件                                   |
| `brew autoremove`          | 自动删除不再需要的依赖包                                     |
| `brew services`            | 管理后台服务（如启动/停止 MySQL、Redis 等）<br>（需配合 `brew services start/stop <包名>` 使用） |
| `brew tap`                 | 添加第三方软件仓库（扩展软件包来源）                         |
| `brew untap`               | 移除已添加的第三方仓库                                       |
| `brew cask install <应用>` | 安装 macOS 应用程序（如 `brew install --cask google-chrome`） |

---

### **Brew 核心优势**：
1. **一键安装**：自动处理依赖关系和配置。
2. **集中管理**：统一管理命令行工具和 GUI 应用。
3. **社区支持**：拥有庞大的开源软件库和活跃社区。
4. **跨平台**：支持 macOS 和 Linux（通过 [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)）。

如果有特定使用场景或问题，可以进一步补充说明！ 😊



