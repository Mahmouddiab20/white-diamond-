@echo off
echo ========================================
echo    White Diamond Plaza - Ready Commands
echo ========================================
echo.

echo The following commands are ready to execute:
echo.
echo 1. git init
echo 2. git add .
echo 3. git commit -m "first commit"
echo 4. git branch -M main
echo 5. git remote add origin https://github.com/Mahmouddiab20/white-diamond-.git
echo 6. git push -u origin main
echo.

echo ========================================
echo    CHOOSE YOUR OPTION:
echo ========================================
echo.
echo OPTION 1: Install Git and run commands
echo 1. Download Git from: https://git-scm.com/downloads
echo 2. Install with default settings
echo 3. Restart Command Prompt
echo 4. Run this script again
echo.

echo OPTION 2: Manual upload to GitHub (RECOMMENDED)
echo 1. Go to: https://github.com/Mahmouddiab20/white-diamond-
echo 2. Click "uploading an existing file"
echo 3. Drag and drop ALL files from this folder
echo 4. Write commit message: "first commit"
echo 5. Click "Commit changes"
echo.

echo OPTION 3: Use GitHub Desktop
echo 1. Download GitHub Desktop from: https://desktop.github.com/
echo 2. Sign in with your GitHub account
echo 3. Clone repository: https://github.com/Mahmouddiab20/white-diamond-.git
echo 4. Copy all project files to the cloned folder
echo 5. Commit and push changes
echo.

echo ========================================
echo    FILES READY FOR UPLOAD:
echo ========================================
echo.
dir /b
echo.
echo Total files: 
dir /b | find /c /v ""
echo.

echo ========================================
echo    NEXT STEPS:
echo ========================================
echo 1. Choose one of the options above
echo 2. Upload all files to GitHub
echo 3. Go to https://netlify.com
echo 4. Connect your GitHub repository
echo 5. Deploy your website
echo.

echo ========================================
echo    COMMANDS READY TO COPY:
echo ========================================
echo.
echo Copy and paste these commands in Command Prompt:
echo.
echo git init
echo git add .
echo git commit -m "first commit"
echo git branch -M main
echo git remote add origin https://github.com/Mahmouddiab20/white-diamond-.git
echo git push -u origin main
echo.

pause
