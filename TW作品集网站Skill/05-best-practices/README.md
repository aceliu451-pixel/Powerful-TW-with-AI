# 最佳实践 Best Practices

使用本 Skill 搭建 TW 作品集时，以下实践能显著提升展示效果。

---

## 内容选择

### 选择真实项目片段，而非完整文档

招聘方看的是你的写作能力和结构化思维，不需要完整的产品文档。每个样例页面保持 500-1000 字即可，重点展示：
- 清晰的信息架构
- 准确的技术描述
- 一致的格式规范

### API 文档样例的选题建议

优先选择你实际参与过的 API。若无实际项目，可基于以下公开 API 重新撰写：
- GitHub REST API（开发者熟悉度高）
- Stripe API（金融场景，结构规范）
- OpenAI API（AI 场景，当下热门）

关键：**不要直接复制官方文档**，要用自己的语言重新组织。

### 用户手册的任务选择

选择 3-5 个高频任务，每个任务控制在 5-8 步以内。避免：
- 过于简单的操作（点击按钮）
- 过于复杂的技术流程（需要大量背景知识）

---

## 结构规范

### 保持导航层级扁平

MkDocs Material 主题在 2 级导航时效果最佳。避免超过 3 级嵌套：

```yaml
# 推荐
nav:
  - Home: index.md
  - API Reference: api-reference.md
  - Case Studies:
    - Project A: case-studies/project-a.md

# 避免
nav:
  - Home: index.md
  - Docs:
    - API:
      - v1:
        - Reference: api/v1/reference.md
```

### 每个页面都要有 H1 标题

MkDocs 使用页面的 H1 作为导航标签和浏览器标题。确保每个 `.md` 文件第一行是 `# 标题`。

---

## Docs-as-Code 实践

### 用 Git 管理内容变更

将作品集仓库设为 public，让招聘方能看到你的 commit 历史：

```bash
git add docs/api-reference.md
git commit -m "docs: add pagination example to GET /resources"
git push
```

规范的 commit message 本身就是 TW 能力的体现。

### 使用 .gitignore 排除构建产物

```gitignore
site/
__pycache__/
*.pyc
.DS_Store
```

### 配置 GitHub Actions 自动部署（进阶）

```yaml
# .github/workflows/deploy.yml
name: Deploy MkDocs
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.x'
      - run: pip install mkdocs-material
      - run: mkdocs gh-deploy --force
```

---

## 作品集展示策略

### 首页是门面，要精心设计

首页的技能表格是招聘方最先看到的内容。建议：
- 技能分类清晰（API docs、User guides、Docs-as-Code 等）
- 每项技能附上具体工具或成果
- 避免空泛描述（"擅长写作"）

### About 页面要有具体数字

```markdown
# 推荐
- 为 3 个开发者产品设计并维护 API 参考文档，覆盖 50+ 端点
- 建立 Docs-as-Code 流水线，文档发布周期从 3 天缩短至 4 小时

# 避免
- 有丰富的 API 文档经验
- 熟悉 CI/CD 流程
```
