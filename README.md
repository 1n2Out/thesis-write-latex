# BrainTumor-Thesis

浙江工商大学学位论文 LaTeX 项目，研究主题为脑肿瘤分割与目标检测。

## 编译

在 VS Code 中打开 `main.tex`，使用 LaTeX Workshop 的 `xelatexmk` 配方。

也可以在项目根目录执行：

```powershell
latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 -outdir=build main.tex
```

生成的论文位于 `build/main.pdf`。

## 目录

- `main.tex` 论文主入口
- `preamble.tex` 全局宏包和格式配置
- `chapters/` 封面、摘要、正文和声明
- `references.bib` 参考文献数据库
- `figures/` 图片资源
- `research/` 研究笔记和论文规划
- `experiments/` 实验数据和实验记录
- `build/` 编译输出
- `logs/` 工作日志

## 写作规则

请阅读 `AGENTS.md`。所有文献、实验数据和研究结论都应经过人工核验。


## 章节组织

每章位于 chapters/ 下的独立目录中，目录内的 chapterN.tex 负责加载该章的小节文件。
