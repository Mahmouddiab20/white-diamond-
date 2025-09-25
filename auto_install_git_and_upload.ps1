# PowerShell script to automatically install Git and upload project
Write-Host "========================================" -ForegroundColor Green
Write-Host "    Auto Install Git and Upload Project" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Git is already installed
try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "Git is already installed: $gitVersion" -ForegroundColor Green
        Write-Host ""
        Write-Host "Proceeding with project upload..." -ForegroundColor Yellow
        
        # Execute the Git commands
        Write-Host "Step 1: Initializing Git repository..." -ForegroundColor Cyan
        git init
        
        Write-Host "Step 2: Adding all files..." -ForegroundColor Cyan
        git add .
        
        Write-Host "Step 3: Committing changes..." -ForegroundColor Cyan
        git commit -m "first commit"
        
        Write-Host "Step 4: Setting main branch..." -ForegroundColor Cyan
        git branch -M main
        
        Write-Host "Step 5: Adding GitHub remote..." -ForegroundColor Cyan
        git remote add origin https://github.com/Mahmouddiab20/white-diamond-.git
        
        Write-Host "Step 6: Pushing to GitHub..." -ForegroundColor Cyan
        git push -u origin main
        
        Write-Host ""
        Write-Host "SUCCESS! Project uploaded to GitHub!" -ForegroundColor Green
        Write-Host "Your project is now available at:" -ForegroundColor Yellow
        Write-Host "https://github.com/Mahmouddiab20/white-diamond-" -ForegroundColor Cyan
        exit
    }
} catch {
    Write-Host "Git is not installed. Downloading and installing..." -ForegroundColor Yellow
}

# Download Git installer
Write-Host "Downloading Git for Windows..." -ForegroundColor Yellow
$gitUrl = "https://github.com/git-for-windows/git/releases/latest/download/Git-2.43.0-64-bit.exe"
$gitInstaller = "$env:TEMP\Git-installer.exe"

try {
    Write-Host "Downloading from: $gitUrl" -ForegroundColor Cyan
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
    Write-Host "Then run this script again" -ForegroundColor Yellow
    Read-Host "Press Enter to continue"
    exit
}

# Install Git silently
Write-Host "Installing Git (this may take a few minutes)..." -ForegroundColor Yellow
try {
    Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT", "/NORESTART", "/NOCANCEL", "/SP-", "/CLOSEAPPLICATIONS", "/RESTARTAPPLICATIONS" -Wait
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
Write-Host "Please restart PowerShell and run this script again to upload the project." -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to exit"
