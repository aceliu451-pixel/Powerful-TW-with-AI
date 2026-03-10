# 术语表 Glossary

本术语表定义 `TW作品集网站Skill` 文档中使用的专有名词。

---

## A

**Admonition（提示框）**
MkDocs Material 主题提供的特殊内容块，用于突出显示注意事项、提示、警告等。通过 `admonition` Markdown 扩展启用。

---

## D

**Docs-as-Code**
将文档像代码一样管理的实践方法：使用纯文本格式（Markdown）、版本控制（Git）、代码审查（Pull Request）和 CI/CD 自动化发布文档。

---

## G

**GitHub Pages**
GitHub 提供的免费静态网站托管服务。MkDocs 通过 `mkdocs gh-deploy` 命令将生成的 `site/` 目录推送到仓库的 `gh-pages` 分支，GitHub 自动将其发布为网站。

---

## I

**init-portfolio.sh**
本 Skill 的核心脚本文件。一个 Bash 脚本，运行后自动安装依赖、生成 MkDocs 项目结构和示例内容。

---

## K

**Keep a Changelog**
一种发布说明的写作规范（keepachangelog.com），要求按 Added / Changed / Deprecated / Removed / Fixed / Security 分类记录每个版本的变更。

---

## M

**Material for MkDocs**
MkDocs 的第三方主题，提供响应式布局、深色模式、搜索、代码高亮、提示框等丰富功能。通过 `pip install mkdocs-material` 安装。

**MkDocs**
基于 Python 的静态文档网站生成器。读取 Markdown 文件和 `mkdocs.yml` 配置，生成可部署的 HTML 网站。

**mkdocs.yml**
MkDocs 项目的配置文件，定义网站名称、主题、导航结构（`nav`）和 Markdown 扩展。

---

## N

**nav（导航配置）**
`mkdocs.yml` 中的 `nav` 字段，定义网站的导航结构。支持嵌套，对应左侧目录树和顶部标签页。

---

## P

**pymdownx**
MkDocs 常用的 Markdown 扩展集合（Python Markdown Extensions），提供代码高亮（`highlight`）、可折叠块（`details`）、嵌套代码块（`superfences`）等功能。

---

## S

**scaffold（脚手架）**
自动生成项目初始文件结构的工具或脚本。`init-portfolio.sh` 是一个脚手架脚本。

**site/（构建输出目录）**
运行 `mkdocs build` 或 `mkdocs gh-deploy` 后生成的目录，包含完整的静态 HTML 网站文件。通常加入 `.gitignore`。

---

## T

**Technical Writer（技术文档工程师，TW）**
负责创作、维护技术文档的专业人员，包括 API 参考、用户手册、发布说明、故障排查指南等。

**toc（目录，Table of Contents）**
页面内的标题导航。MkDocs 通过 `toc` 扩展自动生成，`toc.integrate` 特性将其集成到左侧导航栏。
