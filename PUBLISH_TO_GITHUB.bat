@echo off
setlocal
cd /d "%~dp0"

git --version >nul 2>&1
if errorlevel 1 (
  echo Git is not installed or is not available in PATH.
  echo Install Git for Windows, then run this file again.
  pause
  exit /b 1
)

echo This script adds the extracted project files to the existing GitHub repository.
set /p "REPO_URL=Paste the GitHub repository URL: "
if "%REPO_URL%"=="" (
  echo No repository URL was entered.
  pause
  exit /b 1
)

if not exist ".git" git init
if errorlevel 1 goto failed

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin "%REPO_URL%"
) else (
  git remote set-url origin "%REPO_URL%"
)
if errorlevel 1 goto failed

git fetch origin main
if errorlevel 1 goto failed

git checkout -B main FETCH_HEAD
if errorlevel 1 goto failed

git add .
if errorlevel 1 goto failed

git diff --cached --quiet
if not errorlevel 1 (
  echo No new project files to upload.
  goto success
)

git commit -m "Add Olist analysis notebook, data, and dashboard"
if errorlevel 1 goto failed

git push -u origin main
if errorlevel 1 goto failed

:success
echo.
echo Upload completed successfully.
echo Open your GitHub repository to verify the files.
pause
exit /b 0

:failed
echo.
echo Upload did not complete. Review the Git message above; no success is claimed.
pause
exit /b 1
