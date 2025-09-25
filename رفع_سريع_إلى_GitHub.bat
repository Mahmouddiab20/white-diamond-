@echo off
echo ========================================
echo    White Diamond Plaza - Quick Upload
echo ========================================
echo.

echo Since Git is not installed, here are your options:
echo.
echo OPTION 1: Install Git and use command line
echo 1. Download Git from: https://git-scm.com/downloads
echo 2. Install with default settings
echo 3. Restart Command Prompt
echo 4. Run: upload_to_github.bat
echo.

echo OPTION 2: Upload files directly to GitHub (RECOMMENDED)
echo 1. Go to: https://github.com/Mahmouddiab20/white-diamond-
echo 2. Click "uploading an existing file"
echo 3. Drag and drop ALL files from this folder
echo 4. Write commit message: "Initial commit: White Diamond Plaza website"
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
echo    Files ready for upload:
echo ========================================
echo.
dir /b
echo.
echo Total files: 
dir /b | find /c /v ""
echo.

echo ========================================
echo    Next Steps:
echo ========================================
echo 1. Choose one of the options above
echo 2. Upload all files to GitHub
echo 3. Go to https://netlify.com
echo 4. Connect your GitHub repository
echo 5. Deploy your website
echo.

pause
