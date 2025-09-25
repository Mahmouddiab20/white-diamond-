# PowerShell script to download and install Git automatically
Write-Host "========================================" -ForegroundColor Green
Write-Host "    Installing Git for Windows" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Git is already installed
try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "Git is already installed: $gitVersion" -ForegroundColor Green
        Write-Host ""
        Write-Host "Proceeding with project upload..." -ForegroundColor Yellow
        & ".\upload_to_github.bat"
        exit
    }
} catch {
    Write-Host "Git is not installed. Downloading..." -ForegroundColor Yellow
}

# Download Git installer
Write-Host "Downloading Git for Windows..." -ForegroundColor Yellow
$gitUrl = "https://github.com/git-for-windows/git/releases/latest/download/Git-2.43.0-64-bit.exe"
$gitInstaller = "$env:TEMP\Git-installer.exe"

try {
    Invoke-WebRequest -Uri $gitUrl -OutFile $gitInstaller -UseBasicParsing
    Write-Host "Git installer downloaded successfully!" -ForegroundColor Green
} catch {
    Write-Host "Failed to download Git installer automatically." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please download Git manually:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://git-scm.com/downloads" -ForegroundColor Cyan
    Write-Host "2. Download 'Git for Windows'" -ForegroundColor Cyan
    Write-Host "3. Run the installer with default settings" -ForegroundColor Cyan
    Write-Host "4. Restart PowerShell after installation" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Then run: .\upload_to_github.bat" -ForegroundColor Yellow
    Read-Host "Press Enter to continue"
    exit
}

# Install Git silently
Write-Host "Installing Git (this may take a few minutes)..." -ForegroundColor Yellow
try {
    Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT", "/NORESTART" -Wait
    Write-Host "Git installed successfully!" -ForegroundColor Green
} catch {
    Write-Host "Failed to install Git automatically." -ForegroundColor Red
    Write-Host "Please run the installer manually: $gitInstaller" -ForegroundColor Yellow
    Read-Host "Press Enter to continue"
    exit
}

# Clean up
Remove-Item $gitInstaller -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Git installation completed!" -ForegroundColor Green
Write-Host "Please restart PowerShell and run: .\upload_to_github.bat" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to exit"
