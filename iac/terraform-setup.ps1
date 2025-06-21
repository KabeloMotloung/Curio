Set-Location -Path $PSScriptRoot

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires Administrator privileges. Please run PowerShell as Administrator." -ForegroundColor Red
    exit 1
}

Write-Host "Checking for Chocolatey installation..." -ForegroundColor Yellow
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..." -ForegroundColor Yellow
    
    Set-ExecutionPolicy Bypass -Scope Process -Force
    
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Write-Host "Chocolatey installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Failed to install Chocolatey. Please install manually." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}

if (!(Get-Command terraform -ErrorAction SilentlyContinue)) {
    Write-Host "Terraform not found. Installing Terraform via Chocolatey..." -ForegroundColor Yellow
    choco install terraform -y
    
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    if (Get-Command terraform -ErrorAction SilentlyContinue) {
        Write-Host "Terraform installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Failed to install Terraform. Please install manually." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Terraform is already installed." -ForegroundColor Green
}
# Prompt for AWS credentials
$AWS_ACCESS_KEY_ID = Read-Host "Enter your AWS Access Key ID"
$AWS_SECRET_ACCESS_KEY = Read-Host "Enter your AWS Secret Access Key" -AsSecureString
$AWS_SECRET_ACCESS_KEY = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($AWS_SECRET_ACCESS_KEY))
$AWS_DEFAULT_REGION = Read-Host "Enter your AWS Region (default: eu-west-1)"
if ([string]::IsNullOrWhiteSpace($AWS_DEFAULT_REGION)) {
    $AWS_DEFAULT_REGION = "eu-west-1"
}

# Export environment variables
$env:AWS_ACCESS_KEY_ID = $AWS_ACCESS_KEY_ID
$env:AWS_SECRET_ACCESS_KEY = $AWS_SECRET_ACCESS_KEY
$env:AWS_DEFAULT_REGION = $AWS_DEFAULT_REGION

Write-Host "Initializing Terraform..."
terraform init
if ($LASTEXITCODE -eq 0) {
    Write-Host "Terraform initialization successful." -ForegroundColor Green
} else {
    Write-Host "Terraform initialization failed." -ForegroundColor Red
    exit 1
}

# Create Terraform plan
Write-Host "Creating Terraform plan..."
terraform plan -out=tfplan
if ($LASTEXITCODE -eq 0) {
    Write-Host "Terraform plan created successfully." -ForegroundColor Green
} else {
    Write-Host "Failed to create Terraform plan." -ForegroundColor Red
    exit 1
}

# Confirm apply
$answer = Read-Host "Do you want to apply this plan? (yes/no)"
if ($answer -eq "yes") {
    Write-Host "Applying Terraform plan..."
    terraform apply "tfplan"
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Terraform apply successful." -ForegroundColor Green
    } else {
        Write-Host "Terraform apply failed." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Apply cancelled." -ForegroundColor Yellow
}

Write-Host "Press Enter to exit..."
Read-Host