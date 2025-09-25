@echo off
echo Installing Git for Windows...
echo.

REM Check if Git is already installed
git --version >nul 2>&1
if %errorlevel% == 0 (
    echo Git is already installed!
    git --version
    goto :end
)

echo Git is not installed. Please download and install it manually.
echo.
echo Steps to install Git:
echo 1. Go to: https://git-scm.com/downloads
echo 2. Download "Git for Windows"
echo 3. Run the installer
echo 4. Use default settings
echo 5. Restart Command Prompt after installation
echo.
echo After installing Git, run this script again to continue with the project upload.
echo.

:end
pause
