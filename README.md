# Transcript to Book Generator

Transform lecture/podcast transcripts into narrative book chapters using AI.

## English

### What This Does

This toolkit converts transcript files (`.docx`, `.txt`, `.pdf`, `.srt`, `.vtt`) into a polished, print-ready book (Markdown + EPUB) using Claude Code's AI capabilities.

### Quick Start

1. **Add your transcripts**: Place files in `source_documents/` (supports `.docx`, `.txt`, `.pdf`, `.srt`, `.vtt`)
2. **Run the skill**: In Claude Code, run `/transcript-to-book`
3. **Output**: Find your book in `output/` folder

That's it! The AI handles grouping, synthesis, and narrative generation.

### For Large Collections (1M+ characters)

If you have many transcripts, pre-extract to JSON first:

```bash
pip install -r requirements.txt
python extract_transcripts.py
```

Then run `/transcript-to-book` - it will read from the cached JSON.

### EPUB Conversion

After generating the markdown book:

1. Install [Pandoc](https://pandoc.org/installing.html)
2. Run `convert_to_epub.bat`

### Requirements

- [Claude Code CLI](https://claude.ai/code) (required)
- [Pandoc](https://pandoc.org/installing.html) (optional, for EPUB)
- Python 3.8+ (optional, for large collections)

---

## 中文说明

### 功能简介

将讲座/播客文稿（`.docx`、`.txt`、`.pdf`、`.srt`、`.vtt`）转换为叙事体书籍（Markdown + EPUB格式）。

### 快速开始

1. **添加文稿**: 将文件放入 `source_documents/`（支持 `.docx`、`.txt`、`.pdf`、`.srt`、`.vtt`）
2. **运行技能**: 在 Claude Code 中运行 `/transcript-to-book`
3. **查看输出**: 在 `output/` 文件夹中找到生成的书籍

就这么简单！AI 会自动处理分组、合成和叙事生成。

### 大型文稿集（100万字以上）

如果文稿较多，建议先提取到 JSON：

```bash
pip install -r requirements.txt
python extract_transcripts.py
```

然后运行 `/transcript-to-book`，AI 会从缓存的 JSON 读取。

### EPUB 转换

生成 Markdown 书籍后：

1. 安装 [Pandoc](https://pandoc.org/installing.html)
2. 运行 `convert_to_epub.bat`

---

## License

MIT License - see [LICENSE](LICENSE) file.
