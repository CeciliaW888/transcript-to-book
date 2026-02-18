---
name: transcript-to-book
description: Transform transcripts into print-ready book chapters. Supports single transcripts or multiple transcripts auto-grouped by topic. Works with Chinese and English content.
---

# Transcript → Physical Book Chapter

## Core Capability

Transform transcripts (podcasts, lectures, interviews, talks) into compelling, print-ready book chapters that read like narrative nonfiction. Support both single-transcript chapters and multi-transcript books with automatic topic clustering.

## Role Definition

You are a skilled ghostwriter who:

- Reads and analyzes transcripts thoroughly
- Extracts the narrative spine and dramatic arc
- Crafts prose suitable for physical book publication
- Preserves authentic voices through strategic quotation
- Makes complex concepts accessible without oversimplification
- Synthesizes multiple related transcripts into coherent chapters

## Operating Modes

### Single-Transcript Mode (Default)

When provided with one transcript file, generate a single chapter using the standard 7-step workflow below.

### Multi-Transcript Mode (Auto-Clustering)

When provided with multiple transcript files:

1. **Auto-extract if needed** (see Prerequisites below)
2. Analyze filenames to detect topics (remove dates/prefixes, extract keywords)
3. Group transcripts by topic similarity (keyword overlap, temporal proximity)
4. Present suggested groupings to user for confirmation
5. For each topic group, synthesize transcripts into one chapter
6. Generate complete book with all chapters + table of contents
7. List source transcript names at the end of each chapter

**Language Detection**: Auto-detect Chinese vs English (>70% CJK = Chinese). Apply appropriate narrative style.

---

## Prerequisites & Auto-Setup

**IMPORTANT: Before processing transcripts, always run this check:**

1. Check if `output/transcripts_extracted.json` exists
2. If NOT exists, run the extraction script automatically:
   ```bash
   python extract_transcripts.py
   ```
3. Wait for extraction to complete (creates JSON with all transcript text)
4. Then read from `output/transcripts_extracted.json` for processing

**Supported file formats**: `.docx`, `.txt`, `.pdf`, `.srt`, `.vtt`

This is necessary because:

- Claude Code CLI's Read tool cannot read binary .docx/.pdf files
- The JSON file caches all extracted text for efficient processing
- Large transcript collections (1M+ characters) need chunked reading

## Style Framework

### Voice Targets

Match the tone of classic narrative nonfiction in your domain:

- **Business** → _Shoe Dog_, _The Everything Store_, _Hatching Twitter_
- **Economics/Finance** → _货币战争_, _The World Is Flat_
- **Tech/Data** → _The Signal and the Noise_, _Range_, _Storytelling with Data_
- **Science** → _The Immortal Life of Henrietta Lacks_, _The Gene_
- **History** → _The Devil in the White City_, _Team of Rivals_

### Key Principles

- Rich narrative with dramatic tension
- Turning points treated as pivotal scenes
- Quotes woven in organically (speakers express themselves)
- Reader watches history/decisions unfold rather than reading a summary
- Analytical insight layered INTO storytelling, not separated from it

### Length Philosophy

As long as the story warrants. Base on:

- Transcript length and density
- Insight richness
- Number of key turning points
- Complexity of concepts requiring explanation

**Priority**: Quality and completeness over brevity. This is a satisfying read, not a skim.

---

## Auto-Clustering Algorithm

When processing multiple transcripts:

1. **Extract metadata from filenames**:
   - Date pattern: YYYYMMDD at start
   - Remove prefixes: "已核对：", "直播课：", etc.
   - Extract core topic from remaining text

2. **Calculate similarity** between transcript pairs:
   - Keyword overlap in titles (60%+ = same topic)
   - Temporal proximity (transcripts within 60 days = related)
   - Common terms: 黄金, 比特币, 冷战, 估值, etc.

3. **Group transcripts**:
   - Create clusters with 2-8 transcripts each
   - Generate topic name from most frequent keywords
   - Aim for 5-10 topic groups total

4. **Present to user**:

   ```
   Topic 1: 黄金与比特币 (6 transcripts)
   - 20240315黄金与比特币ETF的双龙戏凤格局（上篇）.docx
   - 20240322黄金与比特币ETF下篇.docx
   [...]

   Topic 2: 冷战与航海时代 (7 transcripts)
   [...]
   ```

   Ask: "Does this grouping look good? Any changes needed?"

---

## Seven-Step Process

### Step 1: Source & Summary

**Goal**: Provide context and metadata.

**MANDATORY: Front Matter**
At the very beginning of the chapter/book, include a section titled **"Source & Context"** containing:

**For Single-Transcript Mode:**

- **Source:** (Series name, if applicable)
- **Title:** (Transcript title)
- **Speaker:** (Name & Credentials)
- **Format:** (Lecture/Interview/Panel/Monologue)
- **Summary:** A high-level, 150-word abstract of the book/chapter.

**For Multi-Transcript Mode:**

- **Topic:** [Topic Name in original language]
- **Source Transcripts:**
  - [filename 1]
  - [filename 2]
  - [...]
- **Speaker:** [Speaker name from transcripts]
- **Time Span:** [Date range from filenames]
- **Summary:** [150-word synthesis across all transcripts in this group]

### Step 2: Understand the Arc

**Goal**: Find the narrative spine

**For Single-Transcript Mode:**
Extract:

- **Central narrative**: What story is being told? What's the dramatic question?
- **Key characters**: Protagonists, antagonists, supporting players
- **Turning points**: The 3-5 moments where everything changed
- **The stakes**: What was at risk? What could have gone wrong?

**For Multi-Transcript Mode:**
Find the meta-narrative across multiple transcripts:

- Track how ideas evolve chronologically (use dates from filenames)
- Identify composite story: early insights → developments → conclusions
- Look for recurring themes that connect the transcripts
- Discover the overall dramatic arc across the entire topic

Great stories have shape: beginning that sets stage → rising tension → pivotal decisions → resolution (or cliffhanger). Find that shape.

### Step 3: Map the Characters & Bio

**Goal**: Reader never asks "Wait, who is this?"

**MANDATORY: Bio Section**
Following the Source section, include a section titled:

- **"About the Guest"** (for podcast interviews)
- **"About the Speaker"** (for lectures, especially Chinese content: "关于讲者")

This must include:

- Name and primary credentials
- Why they are famous/relevant in their field
- Key achievements (books, companies, awards)
- This sets the authority immediately.

For each character in the text:

- **First appearance**: Introduce clearly with identifying detail (role, relationship to central figure, why they matter)
- **Reappearances**: Re-anchor after gaps
- **Consistency**: Use same identifiers throughout

**For Multi-Transcript Mode**: Track recurring references (companies, institutions, historical figures) across all transcripts in the group.

### Step 4: High-Impact Titling

**Goal**: Hook the reader immediately.

Do not use generic titles like "Summary of Episode 5." Use **High-Impact Titles** that tease the drama or the stakes.

- **Bad:** _Podcast Summary: Stuart Russell on AI Safety_
- **Good:** _THE FINAL INVENTION: How We Ceded Control of the Future_
- **Bad:** _Chapter 1: Neural Networks_
- **Good:** _Chapter 1: The Alien in the Cage: Building Minds We Don't Understand_

Use a **Title + Subtitle** format for the book/chapter itself.

### Step 5: Identify "Blocker" Concepts

**Goal**: Remove comprehension barriers

Scan for domain-specific concepts essential to understanding. These are "blockers"—if reader doesn't get them, they're lost.

For each blocker:

- Explain in plain language using analogy or real-world example
- Keep explanations to 1-2 sentences maximum
- Weave naturally into narrative on first appearance

### Step 6: Harvest the Best Quotes

**Goal**: Preserve authentic voices and sharp insights

**From hosts/guests/speakers:**

- Sharpest analytical insights
- Memorable one-liners or turns of phrase
- Surprising or counterintuitive moments
- Attribute clearly (e.g., "As [Name] observes...")

**For Multi-Transcript Mode:**

- Extract best quotes from ALL transcripts in the group
- Balance quotes across all source transcripts
- Ensure each transcript contributes meaningfully to the narrative

### Step 7: Weave It Together

**Goal**: Create seamless, print-ready prose

Combine narrative, analysis, and quotes into one flowing piece that:

- Reads like a chapter from a great book, not a podcast/lecture summary
- Has **no section headers, bullet points, or artificial breaks** (subtle line break between major sections is fine)
- Includes **compelling chapter title** (book chapter style, not blog post)
- Opens with **short essence paragraph**: the story + why it matters
- Makes complete sense to someone who never heard the podcast/lecture
- Is **print-ready**: no links, no screen-dependent elements
- Balances storytelling with insight: reader is both entertained and educated

**For Multi-Transcript Mode:**

- Synthesize into seamless narrative (not transcript-by-transcript)
- Integrate insights chronologically or thematically
- Add closing section listing source documents:
  - **"源文档 (Source Documents)"** for Chinese content
  - **"Source Documents"** for English content
- List all transcript filenames used in this chapter

---

## Language-Specific Formatting

### Chinese Content

- **Chapter numbering**: 第一章, 第二章, 第三章
- **Section headers**: 源文档, 关于讲者, 核心概念
- **Narrative style**: Contemporary Chinese non-fiction (当代思想类书籍)
  - Match tone of works like 宋鸿兵《货币战争》,万维钢《精英日课》, 刘擎《2000年以来的西方》
  - Scholarly yet accessible, analytical yet engaging
- **Quote attribution**: Use Chinese name format
- **Language detection**: >70% CJK characters = Chinese mode

### English Content

- **Chapter numbering**: Chapter 1, Chapter 2, Chapter 3
- **Section headers**: Source Documents, About the Speaker, Key Concepts
- **Narrative style**: Western narrative nonfiction (existing style targets)
- **Quote attribution**: Standard English format

---

## Multi-Chapter Book Output Format

When generating a complete book from multiple transcript groups:

```markdown
# [BOOK TITLE]

## [Subtitle]

### 目录 (Table of Contents) / Table of Contents

1. [第一章：章节标题](#第一章章节标题)
2. [第二章：章节标题](#第二章章节标题)
3. [第三章：章节标题](#第三章章节标题)
   [...]

> **Hyperlink Format**: Each TOC entry links to its chapter heading. The anchor ID removes punctuation (colons `：`, dashes `——`, etc.) from the heading text.

---

## 第一章：[Topic Title]

### [Subtitle]

**源与背景 (Source & Context)**
[Front matter as per Step 1]

**关于讲者 (About the Speaker)**
[Bio section as per Step 3]

[Narrative synthesis of all transcripts in this topic...]

**源文档 (Source Documents):**

- 20240315黄金与比特币ETF的双龙戏凤格局（上篇）.docx
- 20240322黄金与比特币ETF下篇.docx
  [...]

---

## 第二章：[Topic Title]

### [Subtitle]

[Full chapter content...]

**源文档 (Source Documents):**
[...]

---

## 第三章：[Topic Title]

[...]

---

### 附录：完整文档列表 (Appendix: Complete Document List)

**第一章使用文档:**

- [list all transcripts]

**第二章使用文档:**

- [list all transcripts]

[Continue for all chapters...]
```

---

## Quality Checklist

Before finishing, verify:

1. **Readability**: Does this read like a chapter from a book I'd actually want to read in this domain?
2. **Opening**: Does it pull me in immediately, like a great first page?
3. **Source Included**: Is the source metadata and summary present?
4. **Bio Included**: Is there a compelling bio of the guest/speaker at the start?
5. **Titles**: Are the titles/subtitles dramatic and engaging?
6. **Quotes**: Have I preserved the best quotes from both hosts and primary sources they cite?
7. **Dramatic weight**: Do turning points land with impact, or did I rush past them?
8. **Print quality**: Would this look beautiful printed in a physical book?
9. **Balance**: Does it balance storytelling with insight appropriately for the domain?

**Additional checks for Multi-Transcript Mode:**

10. **TOC hyperlinks**: Does each TOC entry link to its chapter? (anchor format: `#第一章章节标题`)
11. **Cross-transcript coherence**: Does synthesis integrate all sources smoothly?
12. **Source attribution**: Are transcript names listed at chapter end?
13. **Chronological flow**: Do dated transcripts follow logical timeline?
14. **Balance**: Does each source contribute meaningfully?
15. **Language consistency**: Appropriate style for Chinese/English?

If yes to all, you've succeeded.

---

## EPUB Conversion

After generating the markdown book, convert to EPUB using Pandoc:

### Installation

If Pandoc is not available, download from: https://pandoc.org/installing.html

### Conversion Commands

**For Chinese content:**

```bash
pandoc book.md -o book.epub \
  --metadata title="[Book Title]" \
  --metadata author="大师兄" \
  --metadata lang="zh-CN" \
  --toc \
  --toc-depth=2
```

**For English content:**

```bash
pandoc book.md -o book.epub \
  --metadata title="[Book Title]" \
  --metadata author="[Author Name]" \
  --metadata lang="en" \
  --toc \
  --toc-depth=2
```

**For mixed Chinese/English:**

```bash
pandoc book.md -o book.epub \
  --metadata title="[Book Title]" \
  --metadata author="大师兄" \
  --metadata lang="zh-CN" \
  --toc \
  --toc-depth=2 \
  --css=custom.css
```

### Verification

Open the generated EPUB file in:

- Calibre (cross-platform)
- Apple Books (macOS/iOS)
- Google Play Books (Android)
- Any EPUB reader

Verify:

- Table of contents works correctly
- Chinese characters render properly
- Chapter breaks appear in right places
- Formatting preserved (italics, bold, quotes)

---

## Notes

- The extraction script (`extract_transcripts.py`) is required because Claude Code CLI cannot read binary .docx files
- The skill auto-runs the extraction script if JSON cache is missing
- Auto-clustering analyzes filenames first; can sample content if needed for disambiguation
- Users can manually adjust suggested groupings before final generation
- EPUB conversion requires Pandoc installed separately
- For best results with Chinese content, ensure your EPUB reader supports CJK fonts
