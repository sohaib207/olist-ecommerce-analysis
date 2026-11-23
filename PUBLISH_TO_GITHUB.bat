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

echo This script adds the complete extracted project to your existing GitHub repository.
set /p "REPO_URL=Paste https://github.com/sohaib207/olist-ecommerce-analysis.git: "
if "%REPO_URL%"=="" (
  echo No repository URL was entered.
  pause
  exit /b 1
)

if not exist ".git" git init
if errorlevel 1 goto failed

rem Reuse an existing Git identity; ask only if Git has no configured identity.
git config user.name >nul 2>&1
if errorlevel 1 (
  set /p "GIT_NAME=Enter the name for this commit: "
  if "%GIT_NAME%"=="" goto failed
  git config user.name "%GIT_NAME%"
)
git config user.email >nul 2>&1
if errorlevel 1 (
  set /p "GIT_EMAIL=Enter your Git commit email (a GitHub noreply address is fine): "
  if "%GIT_EMAIL%"=="" goto failed
  git config user.email "%GIT_EMAIL%"
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin "%REPO_URL%"
) else (
  git remote set-url origin "%REPO_URL%"
)
if errorlevel 1 goto failed

git fetch origin main
if errorlevel 1 goto failed

git branch -M main
if errorlevel 1 goto failed

rem Align with the README already created online without deleting extracted project files.
git reset --mixed FETCH_HEAD
if errorlevel 1 goto failed

git add -A
if errorlevel 1 goto failed

git diff --cached --quiet
if not errorlevel 1 (
  echo No additional project files need uploading.
  goto success
)

git commit -m "Add complete Olist analysis data and Power BI report"
if errorlevel 1 goto failed

git push -u origin main
if errorlevel 1 goto failed

:success
echo.
echo Upload completed successfully.
echo Refresh the GitHub repository and verify the files.
pause
exit /b 0

:failed
echo.
echo Upload did not complete. Review the Git message above; do not assume it succeeded.
pause
exit /b 1
