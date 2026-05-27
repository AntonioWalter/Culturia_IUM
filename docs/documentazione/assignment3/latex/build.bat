@echo off
REM ────────────────────────────────────────────────────────
REM  Culturia IUM — LaTeX Build Script (Windows)
REM ────────────────────────────────────────────────────────
REM  Uso:
REM    build.bat          → compila il PDF
REM    build.bat clean    → rimuove la cartella build
REM    build.bat watch    → compila in continuo
REM ────────────────────────────────────────────────────────

if "%1"=="clean" goto :clean
if "%1"=="watch" goto :watch

:build
if not exist build mkdir build
latexmk -pdf -output-directory=build main.tex
copy build\main.pdf ..\assignment3.pdf
echo.
echo ✅  PDF generato: ..\assignment3.pdf
goto :eof

:clean
if exist build rmdir /s /q build
if exist ..\assignment3.pdf del ..\assignment3.pdf
echo.
echo 🧹  Build pulita.
goto :eof

:watch
if not exist build mkdir build
latexmk -pdf -pvc -output-directory=build main.tex
goto :eof
