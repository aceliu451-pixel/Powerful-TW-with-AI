# 脚本参数参考 Script Reference

`init-portfolio.sh` 的完整参数说明与行为定义。

---

## 语法

```bash
./init-portfolio.sh [target-dir]
```

---

## 参数

| 参数 | 类型 | 必填 | 默认值 | 说明 |
|------|------|------|--------|------|
| `target-dir` | string | 否 | `.`（当前目录） | 生成文件的目标目录路径。目录不存在时自动创建。 |

---

## 示例

```bash
# 在当前目录生成
./init-portfolio.sh

# 在指定目录生成
./init-portfolio.sh my-portfolio

# 使用绝对路径
./init-portfolio.sh /Users/yourname/projects/tw-portfolio
```

---

## 脚本行为

### 依赖检查

脚本启动时检查 `mkdocs-material` 是否已安装：

```bash
python3 -c "import mkdocs_material"
```

- 若未安装：自动执行 `pip3 install --quiet mkdocs-material`
- 若已安装：跳过，直接继续

### 生成的文件

| 文件 | 说明 |
|------|------|
| `mkdocs.yml` | MkDocs 配置文件，包含主题、导航、Markdown 扩展 |
| `README.md` | 项目说明，包含快速开始命令 |
| `docs/index.md` | 首页，含个人介绍与技能概览模板 |
| `docs/api-reference.md` | REST API 文档样例（含认证、端点、错误码） |
| `docs/user-guide.md` | 任务导向用户手册样例 |
| `docs/release-notes.md` | Keep a Changelog 格式的发布说明样例 |
| `docs/troubleshooting.md` | 错误码表格与 FAQ 样例 |
| `docs/style-guide.md` | 写作规范样例（语气、格式、术语） |
| `docs/about.md` | 关于我页面模板 |

### mkdocs.yml 配置项

脚本生成的 `mkdocs.yml` 包含以下配置：

**主题功能（features）**

| Feature | 说明 |
|---------|------|
| `navigation.tabs` | 顶部标签页导航 |
| `navigation.sections` | 左侧目录分组 |
| `toc.integrate` | 目录集成到左侧导航 |

**Markdown 扩展**

| 扩展 | 功能 |
|------|------|
| `toc` | 标题锚点链接 |
| `admonition` | 提示框（note、tip、warning 等） |
| `pymdownx.details` | 可折叠提示框 |
| `pymdownx.highlight` | 代码高亮（含行号锚点） |
| `pymdownx.superfences` | 嵌套代码块 |
| `tables` | GFM 表格 |

---

## 退出码

| 退出码 | 含义 |
|--------|------|
| `0` | 成功 |
| 非零 | 脚本因 `set -euo pipefail` 在某步骤失败时中止 |

---

## 环境要求

- Shell：bash（`#!/usr/bin/env bash`）
- Python：3.8+
- pip3：任意版本
- 网络：安装 `mkdocs-material` 时需要访问 PyPI
