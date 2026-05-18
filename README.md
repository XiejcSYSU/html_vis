# html_vis

可视化 HTML 存档，通过 GitHub Pages 在线访问。

## 工作流

把新生成的可视化 HTML 复制（或软链）到本目录，然后跑：

```bash
./push.sh                     # 自动更新 index + commit + push
./push.sh '说明性 commit msg'  # 自定义 commit message
```

`update_index.sh` 会扫描所有 `*.html`（除 index.html）自动重建首页列表。
