# 个人求职主页

面向 **风控 / 数据科学** 岗位的静态单页简历网站。纯 HTML/CSS/JS,无构建依赖,可直接部署。

## 目录结构

```
portfolio/
├── index.html       # 页面主体(所有文案在这里改)
├── css/style.css    # 样式
├── js/main.js       # 交互(导航、年份等)
├── assets/          # 存放简历 PDF 等静态文件
└── README.md
```

## 使用前需要修改的地方

在 `index.html` 里搜索 `TODO`,逐一替换为你的真实信息:

1. **姓名 / 岗位 / 一句话介绍** —— Hero 区
2. **简历 PDF** —— 放到 `assets/resume.pdf`,或替换「下载简历」按钮的链接
3. **社交链接** —— GitHub / 邮箱 / LinkedIn
4. **关于我** —— 自我介绍段落
5. **技能** —— 按实际情况增删分组与标签
6. **经历 / 项目 / 论文 / 教育** —— 填写真实内容
7. **联系方式** —— 邮箱与社交链接

> 配色主题色在 `css/style.css` 顶部的 `:root` 变量里,`--primary` 是深蓝,`--accent` 是暖橙,可直接改。

## 本地预览

任选其一:

```bash
cd /Users/kangwang/Documents/tex/risk-control-notes/portfolio
python3 -m http.server 8000
```

然后浏览器打开 <http://localhost:8000>。

## 部署

### GitHub Pages

1. 在 GitHub 新建仓库(如 `portfolio`)
2. 把 `portfolio/` 目录内容推上去(把 `index.html` 放在仓库根目录)
3. 仓库 → Settings → Pages → Source 选 `main` 分支根目录 → 保存
4. 访问 `https://<你的用户名>.github.io/portfolio/`

### Vercel / Netlify

- 直接把 `portfolio/` 目录拖到 Vercel / Netlify 即可,无需构建配置。

## 说明

- 无需安装任何依赖,双击 `index.html` 也能直接打开查看(只是简历路径等相对路径在本地 file 协议下仍可正常工作)。
- 所有内容均为占位示例,请替换后再投递。
