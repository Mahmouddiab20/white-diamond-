@echo off
echo ========================================
echo    Installing Git and Uploading Project
echo ========================================
echo.

REM Check if Git is already installed
git --version >nul 2>&1
if %errorlevel% == 0 (
    echo Git is already installed!
    git --version
    echo.
    echo Proceeding with project upload...
    call "git_upload_commands.bat"
    goto :end
)

echo Git is not installed. Please install it first.
echo.
echo ========================================
echo    INSTALLATION INSTRUCTIONS:
echo ========================================
echo.
echo 1. Download Git from: https://git-scm.com/downloads
echo 2. Run the installer with these settings:
echo    - Use Git from the command line and also from 3rd-party software
echo    - Use the OpenSSL library
echo    - Checkout Windows-style, commit Unix-style line endings
echo    - Use Windows' default console window
echo    - Use MinTTY (the default terminal of MSYS2)
echo    - Default (fast-forward or merge)
echo    - Git Pull
echo    - Use bundled OpenSSH
echo    - Use the OpenSSL library
echo    - Use the native Windows Secure Channel library
echo    - Enable file system caching
echo    - Enable Git Credential Manager
echo    - Enable symbolic links
echo.
echo 3. After installation, restart Command Prompt
echo 4. Run this script again
echo.

echo ========================================
echo    ALTERNATIVE: Manual Upload
echo ========================================
echo.
echo If you don't want to install Git, you can upload manually:
echo 1. Go to: https://github.com/Mahmouddiab20/white-diamond-
echo 2. Click "uploading an existing file"
echo 3. Drag and drop ALL files from this folder
echo 4. Write commit message: "first commit"
echo 5. Click "Commit changes"
echo.

:end
pause
