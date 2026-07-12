@echo off
echo Starting automated deployment...

REM Check if we're in a git repository
echo Checking Git repository status...
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Not in a git repository
    echo Please make sure you're in a folder that has been initialized with 'git init'
    pause
    exit /b 1
)

echo Git repository detected successfully

REM Add all changes
echo Adding all changes...
git add .

REM Check if there are changes to commit
echo Checking for changes...
git diff-index --quiet HEAD -- >nul 2>&1
if %errorlevel% equ 0 (
    echo No changes to commit
    echo You need to make changes before running this script
    pause
    exit /b 0
)

echo Changes found, proceeding with commit...

REM Commit with timestamp
echo Committing changes...
git commit -m "Automated update %date% %time%"

if %errorlevel% equ 0 (
    echo Commit successful
) else (
    echo Commit failed
    pause
    exit /b 1
)

echo Pushing to GitHub...
git push origin master

if %errorlevel% equ 0 (
    echo Deployment complete!
) else (
    echo Push failed - check your Git credentials and connection
    pause
    exit /b 1
)

pause