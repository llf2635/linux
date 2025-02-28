**HTTPie** 是一个现代化的命令行 HTTP 客户端，旨在让与 Web 服务的交互更简单、直观。相比传统的 `curl`，它的语法更简洁，输出更易读（支持颜色高亮和自动 JSON 格式化），适合开发者快速调试 API 和 HTTP 请求。

---

### **一、HTTPie 的核心作用**
1. **API 调试**：快速发送 HTTP 请求（GET/POST/PUT/DELETE 等），查看响应头和内容。
2. **JSON 友好**：自动解析和格式化 JSON 请求/响应，支持语法高亮。
3. **替代 `curl`**：提供更人性化的命令语法，减少记忆复杂参数。
4. **文件上传/下载**：简化文件传输操作。
5. **会话管理**：支持保存会话（如登录态），方便重复测试。

---

### **二、安装 HTTPie**
通过 Homebrew 一键安装（macOS/Linux）：
```bash
brew install httpie
http --version
```

---

### **三、基础使用语法**
```bash
http [选项] <请求方法> URL [请求项]
```
- **请求方法**：`GET`（默认）、`POST`、`PUT`、`DELETE` 等。
- **请求项**：可以是头部、查询参数、JSON 字段或文件。

---

### **四、常用命令示例**
#### **1. 发送 GET 请求**
```bash
http GET https://api.example.com/users
```
- **添加查询参数**：
  ```bash
  http GET https://api.example.com/users name==John age==25
  ```

#### **2. 发送 POST 请求（JSON 数据）**
```bash
http POST https://api.example.com/users name=John age=25
```
- **自定义请求头**：
  ```bash
  http POST https://api.example.com/users Authorization:"Bearer token" name=John
  ```

#### **3. 发送表单数据**
```bash
http --form POST https://api.example.com/login username=John password=123
```

#### **4. 文件上传**
```bash
http POST https://api.example.com/upload file@/path/to/image.jpg
```

#### **5. 下载文件**
```bash
http --download https://example.com/file.zip
```

#### **6. 输出控制**
- **仅显示响应头**：
  ```bash
  http --headers GET https://api.example.com
  ```
- **输出为原始内容**（不格式化）：
  ```bash
  http --body GET https://api.example.com
  ```

---

### **五、高级功能**
#### **1. 会话持久化**
保存会话（如登录后的 Cookie）：
```bash
http --session=user_session POST https://api.example.com/login username=John password=123
```
后续请求复用会话：
```bash
http --session=user_session GET https://api.example.com/profile
```

#### **2. 代理设置**
通过代理发送请求：
```bash
http --proxy=http:http://127.0.0.1:8080 GET https://api.example.com
```

#### **3. 超时控制**
设置请求超时时间：
```bash
http --timeout=5 GET https://api.example.com
```

#### **4. 忽略 SSL 证书验证**
（仅用于测试环境）：
```bash
http --verify=no GET https://self-signed-cert-site.com
```

---

### **六、与 `curl` 的对比**
| **操作**            | **HTTPie 命令**                    | **curl 命令**                                                |
| ------------------- | ---------------------------------- | ------------------------------------------------------------ |
| 发送 GET 请求       | `http GET https://api.example.com` | `curl -X GET https://api.example.com`                        |
| 发送 JSON POST 请求 | `http POST url name=John`          | `curl -X POST -H "Content-Type: application/json" -d '{"name":"John"}' url` |
| 显示响应头          | `http --headers GET url`           | `curl -I url`                                                |
| 文件上传            | `http POST url file@/path/to/file` | `curl -F "file=@/path/to/file" url`                          |

---

### **七、典型使用场景**
1. **调试 RESTful API**：快速验证接口返回数据。
2. **测试 Webhook**：模拟第三方服务发送的请求。
3. **查看 HTTP 响应细节**：分析状态码、头部和内容。
4. **自动化脚本**：结合 Shell 脚本批量测试接口。

---

### **八、常用选项速查**
| **选项**       | **作用**                                            |
| -------------- | --------------------------------------------------- |
| `--json`       | 强制 JSON 请求（默认自动识别）                      |
| `--form`       | 发送表单数据（`application/x-www-form-urlencoded`） |
| `--verbose`    | 显示详细请求/响应信息                               |
| `--pretty=all` | 美化输出格式（默认已开启）                          |
| `--follow`     | 自动跟随重定向                                      |

---

通过 HTTPie，你可以用更少的代码完成更复杂的 HTTP 操作，尤其适合 API 开发和调试！ 🚀



# 参考示例


将 `curl -s "https://get.sdkman.io"` 改写为 HTTPie 命令时，需结合 HTTPie 的语法特性与静默模式参数。具体操作如下：

### 改写后的 HTTPie 命令
```bash
http --quiet GET https://get.sdkman.io
```

或简写为：
```bash
http -q https://get.sdkman.io
```

### 关键参数解析
1. **静默模式**  
   通过 `--quiet`（简写 `-q`）参数关闭冗余输出（进度条、状态码等），仅返回响应主体，与 `curl -s` 行为一致。

2. **协议处理**  
   HTTPie 默认支持 HTTPS 协议，无需额外配置。原 URL 中的 `https://` 无需修改，直接保留即可。

3. **方法省略**  
   HTTPie 对于 `GET` 请求可省略方法声明，但显式声明 `GET` 可增强可读性（尤其在含参数的复杂命令中）。

### 功能等价性验证
- 原 `curl` 命令通过 `-s` 隐藏进度信息并获取目标地址内容；HTTPie 通过 `-q` 实现相同效果。
- 两者均通过 HTTPS 协议安全传输数据，无协议降级风险。

