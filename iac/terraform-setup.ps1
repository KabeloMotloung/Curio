# PowerShell script to install the latest Terraform on Windows
$ErrorActionPreference = 'Stop'

# Get latest version
$releases = Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform/" -UseBasicParsing
$latest = ($releases.Content -split 'terraform/' | Select-Object -Skip 1 | Select-Object -First 1) -split '/' | Select-Object -First 1
if (-not $latest) { Write-Error 'Could not detect latest Terraform version.'; exit 1 }

$arch = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { '386' }
$zip = "terraform_${latest}_windows_${arch}.zip"
$url = "https://releases.hashicorp.com/terraform/$latest/$zip"

# Download
Invoke-WebRequest -Uri $url -OutFile $zip

# Unzip
Expand-Archive -Path $zip -DestinationPath . -Force

# Move to user local bin
$dest = "$env:USERPROFILE\bin"
if (!(Test-Path $dest)) { New-Item -ItemType Directory -Path $dest }
Move-Item -Force terraform.exe $dest

# Add to user PATH if not already present
$oldPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($oldPath -notlike "*${dest}*") {
    [Environment]::SetEnvironmentVariable('Path', "$oldPath;${dest}", 'User')
    Write-Host "Added $dest to your user PATH. Restart your terminal to use 'terraform' from anywhere."
}

# Clean up
Remove-Item $zip

# Verify
& "$dest\terraform.exe" -version
Write-Host "Terraform installed successfully!"