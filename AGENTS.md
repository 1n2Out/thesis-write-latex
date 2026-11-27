# BrainTumor-Thesis 项目规则

- 使用 XeLaTeX 编译论文。
- 论文主入口为 `main.tex`。
- 模板核心文件为 `zjgsuthesis.cls` 和 `zjgsuthesis-numeric.bst`。
- 不得编造参考文献、实验数据、模型结果或研究结论。
- 所有引用必须在 `references.bib` 中有经过核验的条目。
- 正文内容放在 `chapters/`，研究笔记放在 `research/`，实验记录放在 `experiments/`。
- 修改后先检查 LaTeX 编译错误、未定义引用和页边界溢出。
- 编译生成文件放在 `build/`。


- 分割方法为 SegMamba。
- 目标检测方法为 DEIM。

- 每章使用独立目录，章节主文件负责组织小节文件。
