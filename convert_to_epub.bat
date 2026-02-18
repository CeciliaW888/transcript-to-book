@echo off
REM Batch script to convert markdown book to EPUB format
REM Requires Pandoc to be installed: https://pandoc.org/installing.html

echo ========================================
echo 将 Markdown 转换为 EPUB
echo ========================================
echo.

REM Check if pandoc is installed
where pandoc >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] Pandoc 未安装!
    echo.
    echo 请从以下网址下载并安装 Pandoc:
    echo https://pandoc.org/installing.html
    echo.
    echo Windows用户请下载 .msi 安装包
    echo.
    pause
    exit /b 1
)

echo [1/3] 检测到 Pandoc 已安装
pandoc --version | findstr /C:"pandoc"
echo.

REM Set file paths
set INPUT_FILE=output\大师兄讲座精选集.md
set OUTPUT_FILE=output\大师兄讲座精选集.epub

echo [2/3] 开始转换...
echo 输入文件: %INPUT_FILE%
echo 输出文件: %OUTPUT_FILE%
echo.

REM Convert using pandoc with Chinese language support
pandoc "%INPUT_FILE%" -o "%OUTPUT_FILE%" ^
  --metadata title="大师兄讲座精选集" ^
  --metadata author="大师兄" ^
  --metadata lang="zh-CN" ^
  --toc ^
  --toc-depth=2 ^
  --epub-chapter-level=2

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [3/3] ✓ 转换成功!
    echo.
    echo 输出文件: %OUTPUT_FILE%
    echo.
    echo 现在可以使用以下软件打开 EPUB 文件:
    echo - Calibre ^(跨平台^)
    echo - Microsoft Edge ^(Windows内置^)
    echo - Apple Books ^(macOS/iOS^)
    echo - Google Play Books ^(Android^)
    echo.
) else (
    echo.
    echo [错误] 转换失败!
    echo 请检查错误信息
    echo.
)

pause
