# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

A toolkit for transforming lecture/podcast transcripts (.docx files) into narrative book chapters using AI. Outputs Markdown and EPUB formats.

## Directory Structure

```
transcript-to-book/
├── source_documents/       # Your .docx transcript files (user-provided)
├── output/                 # Generated files (JSON, MD, EPUB)
├── .claude/                # Claude Code skills
├── extract_transcripts.py  # Optional: pre-extract for large collections
├── convert_to_epub.bat     # EPUB conversion (requires Pandoc)
├── archive/                # Legacy scripts (not needed)
└── CLAUDE.md               # This file
```

## Quick Workflow

1. User places `.docx` files in `source_documents/`
2. User runs `/transcript-to-book`
3. AI reads files, auto-groups by topic, generates narrative book
4. Output: `output/[book_name].md`

## Key Commands

### Generate Book (Primary)

```
/transcript-to-book
```

The skill will:
- Scan `source_documents/` for all .docx files
- Auto-group by topic similarity and date patterns
- Generate narrative book chapters
- Output to `output/`

### For Large Collections (1M+ characters)

Pre-extract to JSON for better performance:

```bash
python extract_transcripts.py
```

This creates `output/transcripts_extracted.json`. The skill will use this cache if available.

### Convert to EPUB

```bash
convert_to_epub.bat
```

Requires [Pandoc](https://pandoc.org/installing.html).

## Transcript-to-Book Skill

The `.claude/skills/transcript-to-book/SKILL.md` defines a 7-step transformation:

1. **Source & Summary**: Extract metadata and create abstract
2. **Understand the Arc**: Find narrative spine and dramatic structure
3. **Map Characters & Bio**: Introduce speakers consistently
4. **High-Impact Titling**: Create engaging chapter titles
5. **Identify Blocker Concepts**: Explain domain jargon naturally
6. **Harvest Best Quotes**: Preserve authentic voice
7. **Weave Together**: Create seamless print-ready prose

### Language Support

- Auto-detects Chinese vs English (>70% CJK = Chinese mode)
- Chinese: Uses 第一章, 第二章 numbering
- English: Uses Chapter 1, Chapter 2 numbering

### Auto-Grouping

The skill automatically:
- Analyzes filenames for topic keywords
- Groups by date proximity (YYYYMMDD patterns)
- Presents suggested groupings for user confirmation
- Synthesizes multiple transcripts into coherent chapters

## File Generation Rules

> [!IMPORTANT]
> All generated content goes in `output/`.
> Do not create files in root directory.
