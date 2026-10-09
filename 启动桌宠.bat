@echo off
rem 阿比桌宠 一键启动器（双击即可运行）
cd /d "%~dp0"

rem ---- 找 Node.js ----
set "NODE_EXE="
where node >nul 2>nul && set "NODE_EXE=node"
if not defined NODE_EXE if exist "%ProgramFiles%\nodejs\node.exe" set "NODE_EXE=%ProgramFiles%\nodejs\node.exe"
if not defined NODE_EXE if exist "%ProgramFiles(x86)%\nodejs\node.exe" set "NODE_EXE=%ProgramFiles(x86)%\nodejs\node.exe"
if not defined NODE_EXE (
  echo [ERROR] Node.js not found. Please install it from https://nodejs.org
  pause
  exit /b 1
)

rem ---- 首次运行确保 Electron 二进制已下载 ----
if not exist "node_modules\electron\dist\electron.exe" (
  echo Preparing Electron binary, please wait...
  call npm install --no-audit --no-fund
)

echo Starting Abby desktop pet...
"%NODE_EXE%" scripts/start.js
