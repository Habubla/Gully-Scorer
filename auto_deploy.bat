@echo off
echo Starting automated deployment...

REM Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Not in a git repository
    pause
    exit /b 1
)

echo Adding all changes...
git add .

REM Check if there are changes to commit
git diff-index --quiet HEAD -- >nul 2>&1
if %errorlevel% equ 0 (
    echo No changes to commit
    pause
    exit /b 0
)

echo Committing changes...
git commit -m "Automated update %date% %time%"

echo Pushing to GitHub...
git push origin main

echo Deployment complete!
pause