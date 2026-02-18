---
description: Generate a book from transcripts using AI-assisted narrative synthesis
---

# Transcript to Book Generation

Use this workflow to convert lecture/podcast transcripts into a narrative book.

## Prerequisites
- Transcript files in `.docx` format in the workspace
- Or a `transcripts_extracted.json` file with pre-extracted text

## How to Run

### Option 1: Quick Command
Just tell me:
> "Generate a book from the transcripts in [folder path] using the transcript-to-book skill"

### Option 2: Step by Step
1. **Extract transcripts**: If you have .docx files, I'll extract text into JSON
2. **Group by topic**: I'll analyze filenames and suggest chapter groupings
3. **Synthesize chapters**: For each chapter, I'll apply the 7-step process:
   - Source & Context
   - Narrative Arc
   - Character Mapping
   - High-Impact Titling
   - Blocker Concepts
   - Curated Quotes
   - Woven Narrative
4. **Output**: Markdown book file, optionally convert to EPUB

## Customization Options
- **Length**: "Make chapters longer/shorter"
- **Style**: "More analytical" or "More storytelling"
- **Language**: Chinese or English (auto-detected)
- **Split**: "Split large chapters into sub-chapters"

## Example Prompts
- "Generate a book from transcripts in source_documents/"
- "Continue generating the remaining chapters"
- "Make Chapter 2 longer with more quotes"
- "Convert the book to EPUB format"
