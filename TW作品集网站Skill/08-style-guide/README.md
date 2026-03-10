# 写作规范 Style Guide

本规范适用于 `TW作品集网站Skill` 文档本身，以及 `init-portfolio.sh` 生成的作品集网站中的示例内容。

---

## 语气与语调

| 原则 | 正确示例 | 错误示例 |
|------|----------|----------|
| **直接** | "运行以下命令。" | "您可以考虑运行以下命令。" |
| **主动语态** | "脚本自动安装依赖。" | "依赖会被脚本自动安装。" |
| **第二人称** | "你可以修改 `site_name`。" | "用户可以修改 `site_name`。" |
| **具体** | "等待约 30 秒。" | "等待一段时间。" |

---

## 格式规范

### 标题

- 使用句子大小写（英文）：`## Getting started`，不用 `## Getting Started`
- 中文标题无需特殊大小写规则
- 不跳级：H1 → H2 → H3，不从 H1 直接跳到 H3
- 标题末尾不加标点

### 代码

- 行内代码：用于文件名、命令、参数名、值：`mkdocs.yml`、`--dev-addr`
- 代码块：始终指定语言

  ````markdown
  ```bash
  python3 -m mkdocs serve
  ```
  ````

- 命令行示例中，可选参数用方括号：`./init-portfolio.sh [target-dir]`

### 列表

- 有序列表：用于步骤（有先后顺序）
- 无序列表：用于特性、选项（无先后顺序）
- 列表项结构保持平行（都是名词短语，或都是动词开头的句子）

### 表格

- 表头使用名词，不用动词
- 每列宽度尽量均衡
- 必填/可选字段用 ✅ / — 标注，不用"是/否"文字

### 提示框（Admonition）

使用 MkDocs Material 的提示框组件时，选择合适的类型：

| 类型 | 用途 |
|------|------|
| `note` | 补充说明，不影响主流程 |
| `tip` | 提升效率的建议 |
| `warning` | 可能导致问题的操作 |
| `danger` | 不可逆的破坏性操作 |

```markdown
> [!NOTE]
> 这是一条补充说明。
```

---

## 术语一致性

| 使用 | 避免 |
|------|------|
| `init-portfolio.sh` | `init_portfolio.sh`、`init portfolio` |
| MkDocs | mkdocs、Mkdocs |
| Material for MkDocs | Material theme、mkdocs-material |
| GitHub Pages | Github pages、GH Pages |
| Docs-as-Code | docs as code、Docs as Code |
| Technical Writer / TW | technical writer（小写）、文档工程师（中文可用） |
| `mkdocs serve` | `mkdocs server`、`serve mkdocs` |
