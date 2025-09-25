@echo off
echo ========================================
echo    White Diamond Plaza - GitHub Upload
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed!
    echo Please run install_git.bat first to install Git.
    echo.
    pause
    exit /b 1
)

echo Git is installed. Proceeding with upload...
echo.

REM Initialize Git repository
echo Step 1: Initializing Git repository...
git init
if %errorlevel% neq 0 (
    echo ERROR: Failed to initialize Git repository
    pause
    exit /b 1
)

REM Add all files
echo Step 2: Adding all files to Git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to Git
    pause
    exit /b 1
)

REM Commit changes
echo Step 3: Committing changes...
git commit -m "Initial commit: White Diamond Plaza website

- Complete website for furnished apartments in Medina
- Responsive design for mobile and desktop  
- Interactive booking and inquiry forms
- WhatsApp integration
- SEO optimized
- Ready for Netlify deployment"
if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)

REM Add remote origin
echo Step 4: Adding GitHub remote...
git remote add origin https://github.com/Mahmouddiab20/white-diamond-.git
if %errorlevel% neq 0 (
    echo ERROR: Failed to add remote origin
    pause
    exit /b 1
)

REM Set main branch
echo Step 5: Setting main branch...
git branch -M main
if %errorlevel% neq 0 (
    echo ERROR: Failed to set main branch
    pause
    exit /b 1
)

REM Push to GitHub
echo Step 6: Pushing to GitHub...
echo This may require GitHub authentication...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to push to GitHub
    echo This might be due to authentication issues.
    echo Please check your GitHub credentials.
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo    SUCCESS! Project uploaded to GitHub
echo ========================================
echo.
echo Your project is now available at:
echo https://github.com/Mahmouddiab20/white-diamond-
echo.
echo Next steps:
echo 1. Go to https://netlify.com
echo 2. Connect your GitHub repository
echo 3. Deploy your website
echo.
pause
