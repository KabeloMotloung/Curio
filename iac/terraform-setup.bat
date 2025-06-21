@echo off
echo ========================================
echo  Terraform AWS Setup Script
echo ========================================
echo.
echo This script will:
echo - Install Chocolatey (package manager)
echo - Install Terraform
echo - Run your Terraform configuration
echo.
echo NOTE: This will request Administrator privileges
echo Press any key to continue, or close this window to cancel
pause > nul

echo.
echo Requesting Administrator privileges...
powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0terraform-setup.ps1\"' -Verb RunAs"

echo.
echo Script launched with Administrator privileges.
echo Check the new PowerShell window that opened.
pause